deploy:
    hugo --gc --minify && rsync -azvc --delete public/ barklan:static/notes

update-theme:
    hugo mod get -u

dev-server:
    hugo server --minify -D
