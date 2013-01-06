echo ""
echo "gister [http://github.com/dariocravero/gister]"
echo ""
echo "Merging gist $1 into the current project..."

root=`pwd`
tmp_gisted="tmp/gisted"

echo "-> Cleaning up the environment..."
rm -rf $tmp_gisted && mkdir -p $tmp_gisted && cd $tmp_gisted;

echo "-> Fetching the project from Github's gist..."
curl -0 https://gist.github.com/$1/download | tar  --strip-components=1 -xz;

echo "-> Generating project's filesystem..."
for file in `ls`; do
  path=`echo $file | sed "s/_-_/\//g"`;
  dir=`dirname $path`;
  mkdir -p $dir && mv $file $dir/`basename $path`;
done;

echo "-> Syncing files..."
cd $root; rsync -a $tmp_gisted/ ./ && rm -rf $tmp_gisted

echo "Done!"
