#!/bin/bash
#Make Beamer Presentation

pandoc -t beamer --slide-level=2 --latex-engine=pdflatex -V theme:Antibes -V colortheme:seahorse lightning_talk.md -o lightning_talk.pdf