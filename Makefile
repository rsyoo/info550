# rule for making report
report.html: data/clean.txt figs/fig1.png R/report.Rmd
	Rscript -e "rmarkdown::render('R/report.Rmd', output_file = '../output/report.html')"
	
# rule for cleaning data
data/clean.txt: data/birth.Rdata R/clean_data.R
	chmod +x R/clean_data.R && \
	Rscript R/clean_data.R

# rule for making scatterplot
figs/fig1.png: R/make_fig1.R
	chmod +x R/make_fig1.R && \
	Rscript R/make_fig1.R

# install pckg
.PHONY: install
install: R/install_pckg.R
	chmod +x R/install_pckg.R && \
	Rscript R/install_pckg.R
	
# build docker image
.PHONY: build
build: Dockerfile
		docker build -t info550 .
		
# clean up directory
.PHONY: clean
clean:
	rm output/report.html data/clean.txt figs/fig1.png

# help document
.PHONY: help
help:
	@echo "report.html : Generate final analysis report."
	@echo "install     : Install package needed for analysis."
	@echo "clean.Rdata : Clean birth.Rdata."
	@echo "fig1.png    : Make a scatterplot of birthweight by maternal age."
	@echo "build 			 : Build docker image."
	@echo "clean       : Remove cleaned data, figure, and report."
	
