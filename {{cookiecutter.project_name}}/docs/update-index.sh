pushd "$(dirname "$0")" > /dev/null
echo "<html><head><title>Index of Generated Notebooks</title></head><body><h1>Index of Notebooks</h1><ul>" > index.html
tree -H '.'  -I '*.sh' -L 1 --noreport --charset utf-8 >> index.html
echo "</ul></body></html>" >> index.html
popd > /dev/null
