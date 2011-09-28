gem push `gem build flote.gemspec | grep 'File:' | awk '{print $2}'`
mv flote-*.gem deploy
