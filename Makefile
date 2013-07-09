format:
	find . -name "*.h" -exec uncrustify -c ~/uncrustify.cfg -l=OC --replace "{}" \;
	find . -name "*.m" -exec uncrustify -c ~/uncrustify.cfg -l=OC --replace "{}" \;
