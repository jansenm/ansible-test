all: prepare no-tag debug-tag always-tag other-tag

prepare:
	for name in no debug always other; do \
	   sed -e "s/\[] \[/[$$name-tag.yml] [/" roles/tags-test/tasks/template.yml \
	   > roles/tags-test/tasks/$$name-tag.yml; \
	done

%-tag:
	ansible-playbook -t $* tags.yml | tee $*-tag.txt

no-tag:
	ansible-playbook tags.yml | tee no-tag.txt
