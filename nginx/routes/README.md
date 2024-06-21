# Adding routes
#- Routes can be configured using `curl`
#- Nginx should reload when files change
#- All files are executed inside a stream block (not HTTP)
#    - So only stream things will work
## Example: Adding routes
#- `curl -XPUT --data-binary @routes/sjkillen.ca 10.0.0.1/sjkillen.ca`
## Example: Deleting routes
#- `curl -XDELETE 10.0.0.1/sjkillen.ca`
