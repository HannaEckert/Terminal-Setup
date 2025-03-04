(tag_name) @tag
(erroneous_end_tag_name) @tag.error
(doctype) @constant
(attribute_name) @attribute
(attribute_value) @operator
(raw_text) @embedded
(start_tag) @module
(end_tag) @module
(self_closing_tag) @module
(cf_selfclose_tag) @module
(cf_selfclose_tag_end) @module
(cf_output_tag) @module
(cf_return) @module
(cf_query) @module
(cf_set_tag) @module
(cf_transaction_tag) @module
(cf_savecontent_tag) @module
(cf_if_tag) @module
(cf_loop) @module
(binary_expression) @string
(unary_operator) @string
(cf_var) @keyword

; Variables
;----------

(identifier) @keyword


; cfarguments

(cf_selfclose_tag 
  (cf_attribute 
	(cf_attribute_name) @_name (#eq? @_name "name")
	(quoted_cf_attribute_value (attribute_value) @keyword )))

(cf_selfclose_tag 
  (cf_attribute 
	(cf_attribute_name) @_name (#eq? @_name "type")
	(quoted_cf_attribute_value (attribute_value) @type )))

; Properties
;-----------

(property_identifier) @variable

; constructors with new

(new_expression 
  constructor: 
    [(member_expression
	  object: [(member_expression
		object: [(member_expression
		  object: [(member_expression
		    object: [(member_expression
		      object: [(member_expression
		        object: [(member_expression
		          object: [(member_expression
		            object: [(member_expression
		              object: [(member_expression
			            property: (property_identifier) @type) (identifier) @type]?
			          property: (property_identifier) @type) (identifier) @type]?
			        property: (property_identifier) @type) (identifier) @type]?
			      property: (property_identifier) @type) (identifier) @type]?
			    property: (property_identifier) @type) (identifier) @type]?
			  property: (property_identifier) @type) (identifier) @type]?
		    property: (property_identifier) @type) (identifier) @type]?
		  property: (property_identifier) @type) (identifier) @type]?
		property: (property_identifier) @type) (identifier) @type]?
	  property: (property_identifier) @type) (identifier) @type])


; Function and method definitions
;--------------------------------

(cf_function 
  (cf_tag_open 
	(cf_attribute
	  (cf_attribute_name) @_name (#eq? @_name "name")
	  (quoted_cf_attribute_value 
		(attribute_value) @keyword))))

(cf_function 
  (cf_tag_open 
	(cf_attribute
	  (cf_attribute_name) @_name (#eq? @_name "access")
	  (quoted_cf_attribute_value 
		(attribute_value) @string (#eq? @string "public")))))

(cf_function 
  (cf_tag_open 
	(cf_attribute
	  (cf_attribute_name) @_name (#eq? @_name "access")
	  (quoted_cf_attribute_value 
		(attribute_value) @constant (#eq? @constant "private")))))


(quoted_cf_attribute_value 
  (attribute_value) @string (#eq? @string "true"))

(quoted_cf_attribute_value 
  (attribute_value) @constant (#eq? @constant "false"))


(cf_function 
  (cf_tag_open 
	(cf_attribute
	  (cf_attribute_name) @_name (#eq? @_name "returntype")
	  (quoted_cf_attribute_value 
		(attribute_value) @type))))

(cf_component 
  (cf_tag_open 
	(cf_attribute
	  (cf_attribute_name) @_name (#eq? @_name "extends")
	  (quoted_cf_attribute_value 
		(attribute_value) @type))))

(cf_component (cf_tag_open) @module)
(cf_component (cf_tag_close) @module)

(cf_function (cf_tag_open) @module)
(cf_function (cf_tag_close) @module)


(function_expression
  name: (identifier) @function) @definition.function


(function_declaration
  name: (identifier) @function)

(generator_function
  name: (identifier) @function)

(generator_function_declaration
  name: (identifier) @function)

(method_definition
  name: [
    (property_identifier)
    (private_property_identifier)
  ] @function.method)

(method_definition
  name: (property_identifier) @constructor
  (#eq? @constructor "constructor"))

(pair
  key: (property_identifier) @function.method
  value: (function_expression))

(pair
  key: (property_identifier) @function.method
  value: (arrow_function))

(array) @expression

(call_expression 
  function: (member_expression 
	property: (property_identifier) @function.macro))

(assignment_expression
  left: (member_expression
    property: (property_identifier) @function.method)
  right: (arrow_function))

(assignment_expression
  left: (member_expression
    property: (property_identifier) @function.method)
  right: (function_expression))

(variable_declarator
  name: (identifier) @function
  value: (arrow_function))

(variable_declarator
  name: (identifier) @function
  value: (function_expression))

(assignment_expression
  left: (identifier) @function
  right: (arrow_function))

(assignment_expression
  left: (identifier) @function
  right: (function_expression))

; Function and method calls
;--------------------------

(call_expression
  function: (identifier) @function.call)

(call_expression
  function: (member_expression
    property: [
      (property_identifier)
      (private_property_identifier)
    ] @function.macro))

; Literals
;---------
((identifier) @variable.builtin
  (#eq? @variable.builtin "self"))

[
  (true)
  (false)
] @boolean

[
  (null)
] @constant.builtin

[
  (comment)
  (cf_comment)
] @comment @spell

((comment) @comment.documentation
  (#lua-match? @comment.documentation "^/[*][*][^*].*[*]/$"))

((string_fragment) @keyword.directive
  (#eq? @keyword.directive "use strict"))

(string) @string
(text) @string

(escape_sequence) @string.escape

(regex_pattern) @string.regexp
(regex_flags) @character.special

(regex
  "/" @module) ; Regex delimiters

(number) @number

(hash_expression) @markup.math

((identifier) @number
  (#any-of? @number "NaN" "Infinity"))

; Punctuation
;------------
[
  ";"
  "."
  ","
  ":"
] @punctuation.delimiter

(ternary_expression
  [
    "?"
    ":"
  ] @keyword.conditional.ternary)

[
  ">"
] @module

[
  "-"
  "--"
  "-="
  "+"
  "++"
  "+="
  "*"
  "*="
  "**"
  "**="
  "/"
  "/="
  "%"
  "%="
  "<"
  "<="
  "<<"
  "="
  "=="
  "==="
  "!"
  "!="
  "!=="
  "=>"
  ">"
  ">="
  ">>"
  ">>="
  ">>>"
  ">>>="
  "~"
  "^"
  "&"
  "|"
  "^="
  "&="
  "|="
  "&&"
  "||"
  "??"
  "&&="
  "||="
  "??="
] @string

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
  "<"
  ">"
  "</"
  "/>"
] @punctuation.bracket
