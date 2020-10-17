# rule for making report
report.html: clean.Rdata report.Rmd
	Rscript -e "rmarkdown::render('report.Rmd', output_file = 'report.html')"
	
# rule for installing pckg
install: install_pckg.R
	chmod +x install_pckg.R && \
	Rscript install_pckg.R

# rule for cleaning data
clean.Rdata: install_pckg.R clean_data.R birth.Rdata
	chmod +x clean_data.R && \
	Rscript clean_data.R

# rule for making scatterplot
fig1.png: make_fig1.R
	chmod +x make_fig1.R && \
	Rscript make_fig1.R
		
# clean up directory
.PHONY: clean
clean:
	rm report.html clean.Rdata fig1.png

# help document
.PHONY: help
help:
	@echo "report.html : Generate final analysis report."
	@echo "install     : Install package needed for analysis."
	@echo "clean.Rdata : Clean birth.Rdata."
	@echo "fig1.png    : Make a scatterplot of birthweight by maternal age."
	@echo "clean       : Remove cleaned data, figure, and report."
