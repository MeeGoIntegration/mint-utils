#!/usr/bin/python
try:
    from xml.etree import cElementTree as ET
except ImportError:
    import cElementTree as ET

def do_addrepos(self, subcmd, opts, myproject, targetproject):
    """${cmd_name}: Configures a project with repositories that build against
    all the repositories in another project, with matching architectures

    This command creates a set of repositories in a project each with a single
    path that builds only against one repository of another project.
    
    ${cmd_usage}
    ${cmd_option_list}
    """
    path = quote_plus(myproject),
    kind = 'prj'
    data = meta_exists(metatype=kind,
                       path_args=path,
                       template_args=None,
                       create_new=False)
    if data:
        root = ET.fromstring(''.join(data))
        repos = {}
        for repo in get_repos_of_project(conf.config['apiurl'], targetproject):
            if repo.name not in repos:
                repos[repo.name] = []
            repos[repo.name].append(repo.arch)

        if not repos:
            print "osc: no repositories found in %s" % targetproject
            return False

        comment_element = ET.Comment(text="Repositories to build against project %s" % targetproject )
        root.append(comment_element)
        for reponame, archs in repos.iteritems():
            if not archs:
                print "no archs enabled in %s, skipping" % reponame
                continue
            new_reponame = "%s_%s_%s" % (targetproject.replace(":","_"), 
                                         reponame,
                                         "_".join(archs))
            repo_element = ET.Element('repository', name=new_reponame)
            repo_element.append(ET.Element('path', repository=reponame, project=targetproject))
            for arch in archs:
                arch_element = ET.Element('arch')
                arch_element.text = arch
                repo_element.append(arch_element)
            root.append(repo_element)
    else:
        print "osc: an error occured"

    xmlindent(root)
    edit_meta(metatype=kind,
              path_args=path,
              edit=True,
              data=ET.tostring(root))

