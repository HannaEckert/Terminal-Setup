((script_element
  (raw_text) @injection.content)
 (#set! injection.language "javascript"))

((style_element
  (raw_text) @injection.content)
 (#set! injection.language "css"))

((cfscript_content) @injection.content (#set! injection.language "cfscript")) 
((ERROR (identifier)) @injection.content (#set! injection.language "cfscript")) 

((cf_query (text) @injection.content) (#set! injection.language "sql"))