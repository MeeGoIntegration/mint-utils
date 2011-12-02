#!/usr/bin/python
try:
    from xml.etree import cElementTree as ET
except ImportError:
    import cElementTree as ET

from osc import conf

def do_linkprj(self, subcmd, opts, new_project, link_to_project):
    """${cmd_name}: Creates a new project that links to another one

    This command creates a new project that is a project link to another one.
    
    ${cmd_usage}
    ${cmd_option_list}
    """

    new_prj_link = """\
<project name="%(name)s">

  <title>%(name)s</title>
  <description>
  Project link to %(link_source)s
  </description>
  <link project="%(link_source)s"/>
  <person role="maintainer" userid="%(user)s" />
  <person role="bugowner" userid="%(user)s" />
</project>
"""

    path = quote_plus(link_to_project),
    kind = 'prj'
    try:
        data = meta_exists(metatype=kind,
                           path_args=path,
                           template_args=None,
                           create_new=False)
    except urllib2.HTTPError, e:
        if e.code == 404:
            print "osc: Cannot link to non-existent project %s" % link_to_project
            return False
            
    path = quote_plus(new_project),
    kind = 'prj'
    try:
        data = meta_exists(metatype=kind,
                           path_args=path,
                           template_args=None,
                           create_new=False)
    except urllib2.HTTPError, e:
        if e.code != 404:
            raise
        root = ET.fromstring(new_prj_link % { "name" : new_project,
                             "user" : conf.get_apiurl_usr(conf.config['apiurl']),
                             "link_source" : link_to_project
                            })
        repos = {}
        for repo in get_repos_of_project(conf.config['apiurl'], link_to_project):
            if repo.name not in repos:
                repos[repo.name] = []
            repos[repo.name].append(repo.arch)

        if not repos:
            print "osc: no repositories found in %s" % link_to_project
            return False

        comment_element = ET.Comment(text="Repositories to build against project %s" % link_to_project )
        root.append(comment_element)
        for reponame, archs in repos.iteritems():
            if not archs:
                print "no archs enabled in %s, skipping" % reponame
                continue
            repo_element = ET.Element('repository', name="%s_%s" % (link_to_project.replace(":","_"), "_".join(archs)),
                                      linkedbuild="localdep"
                                     )
            repo_element.append(ET.Element('path', repository=reponame, project=link_to_project))
            for arch in archs:
                arch_element = ET.Element('arch')
                arch_element.text = arch
                repo_element.append(arch_element)
            root.append(repo_element)

        xmlindent(root)
        edit_meta(metatype=kind,
                  path_args=path,
                  edit=True,
                  data=ET.tostring(root))
    else:
        print "osc: project %s already exists" % new_project
        return False

