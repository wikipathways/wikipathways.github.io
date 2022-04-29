import csv
from datetime import date
import frontmatter
from frontmatter.default_handlers import YAMLHandler
from io import BytesIO
from pathlib import Path
import sys


repo_dir = Path('./')

ndex_by_wpid = {}

with p.open('_data/ndex_lookup.csv') as f:
    reader = csv.reader(f)
    for row in reader:
        ndex_by_wpid[row['wpid']] = row['ndexid']

wpids = set()
for p in repo_dir.joinpath('../wikipathways.github.io/pathways/').glob('WP*/WP*.md'):
    wpid = p.stem
    wpids.add(wpid)

    post = frontmatter.load(str(p), handler=YAMLHandler())
    
    old_ndex = post.get('ndex', str())
    new_ndex = ndex_by_wpid[wpid]
    
    if old_ndex != new_ndex:
        print(f"updating {wpid} ndex from {old_ndex} to {new_ndex}")
        post['ndex'] = new_ndex
        with p.open('wb') as f:
            frontmatter.dump(post, f)      

