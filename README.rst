Ansible Tests
=============

Just a dumping ground for certain ansible test/checks/trys.

tags.yml
--------

I wondered how applying tags to the include statement changes ansibles
behaviours. So i wrote this little play to test. Using the makefile is required
because the include files in the role 'tags-test' are generated with sed.

What i learned
  - if there is a tag on the include task that is either 'always' or matches on
    of the tags selected for execution (on the command line) then all task in
    the included file will be executed regardless if or which tag they have. .
    *Even if the tag is NOT part of the selected tags*.
  - if there is a tag on the include task that is not selected for execution or
    there is no tag on the include task then in the file only tasks with
    selected tags or with the always tag are executed. Task without tags will
    *NOT* be executed.

So it looks like a match on the include task (or always) trumps the tags in the
file.

I btw. did not YET? check with multiple tags.

