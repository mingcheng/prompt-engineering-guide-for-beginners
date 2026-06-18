JOBNAME   = prompt-engineering-guide-for-beginners
PDF       = $(JOBNAME).pdf
SOURCES   = $(JOBNAME).tex $(wildcard ./chapter/*.tex)
TEMP      = $(JOBNAME).xdv $(JOBNAME).aux $(JOBNAME).log $(JOBNAME).toc $(JOBNAME).out $(JOBNAME).synctex.gz \
            $(wildcard ./chapter/*.aux)

TEX       = xelatex
TEXFLAGS  = -synctex=1 -halt-on-error -interaction=nonstopmode

all: $(PDF)

$(PDF): $(SOURCES)
	$(TEX) $(TEXFLAGS) --no-pdf $(JOBNAME)
	$(TEX) $(TEXFLAGS) $(JOBNAME)

clean:
	rm -f $(PDF) $(TEMP)

count:
	texcount -inc -total -chinese -utf8 $(JOBNAME).tex

.PHONY: all clean count

