(tag_name) @tag
(erroneous_end_tag_name) @tag.error
(doctype) @constant
(attribute_name) @attribute
(attribute_value) @operator
(raw_text) @embedded
(start_tag) @punctuation.delimiter
(end_tag) @punctuation.delimiter
(self_closing_tag) @punctuation.delimiter
(cf_selfclose_tag) @punctuation.delimiter
(cf_selfclose_tag_end) @punctuation.delimiter
(cf_output_tag) @punctuation.delimiter
(cf_return) @punctuation.delimiter
(cf_query) @punctuation.delimiter
(cf_set_tag) @punctuation.delimiter
(cf_transaction_tag) @punctuation.delimiter
(cf_savecontent_tag) @punctuation.delimiter
(cf_if_tag) @punctuation.delimiter
(cf_loop) @punctuation.delimiter
(cf_switch_tag) @punctuation.delimiter
(cf_tag_open) @punctuation.delimiter
(binary_expression) @character.special
(unary_operator) @character.special
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

(cf_tag_open 
  (cf_attribute
    (cf_attribute_name) @_name (#eq? @_name "name")
	  (quoted_cf_attribute_value 
		(attribute_value) @keyword)))

(cf_tag_open 
  (cf_attribute
    (cf_attribute_name) @_name (#eq? @_name "access")
	  (quoted_cf_attribute_value 
		(attribute_value) @string (#eq? @string "public"))))

(cf_tag_open 
  (cf_attribute
    (cf_attribute_name) @_name (#eq? @_name "access")
	  (quoted_cf_attribute_value 
		(attribute_value) @constant (#eq? @constant "private"))))


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

(cf_component (cf_tag_open) @punctuation.delimiter)
(cf_component (cf_tag_close) @punctuation.delimiter)

(cf_function (cf_tag_open) @punctuation.delimiter)
(cf_function (cf_tag_close) @punctuation.delimiter)


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

(regex_pattern) @string.regexp
(regex_flags) @character.special

(regex
  "/" @punctuation.delimiter) ; Regex delimiters

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
] @punctuation.delimiter

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
  "="
  "=="
  "==="
  "!"
  "!="
  "!=="
  "=>"
  ">"
  ">="
  ">>="
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
] @character.special

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
