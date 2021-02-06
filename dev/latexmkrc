# For synctex
$pdflatex = 'pdflatex -interactive=nonstopmode -synctex=1 %O %S';

$pdf_previewer = "start qpdfview --unique";

# For nomenclature
add_cus_dep("nlo", "nls", 0, "nlo2nls");
sub nlo2nls {
  system("makeindex $_[0].nlo -s nomencl.ist -o $_[0].nls -t $_[0].nlg");
}
