; Variables
;----------

(identifier) @variable

; Properties
;-----------

(property_identifier) @variable

; Function and method definitions
;--------------------------------

(function_expression
  name: (identifier) @function)
(function_declaration
  name: (identifier) @function)
(method_definition
  name: (property_identifier) @function.method)

(pair
  key: (property_identifier) @function.method
  value: [(function_expression) (arrow_function)])

(assignment_expression
  left: (member_expression
    property: (property_identifier) @function.method)
  right: [(function_expression) (arrow_function)])

(variable_declarator
  name: (identifier) @function
  value: [(function_expression) (arrow_function)])

(assignment_expression
  left: (identifier) @function
  right: [(function_expression) (arrow_function)])

; Function and method calls
;--------------------------

(call_expression
  function: (identifier) @function)

(call_expression
  function: (member_expression
    property: (property_identifier) @function.macro))


; new expressions with constructor

(formal_parameters 
  _*
    (member_expression
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
	  property: (property_identifier) @type))

(formal_parameters 
    (member_expression
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
	  property: (property_identifier) @type))

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

(ERROR 
  (identifier)
  (identifier) @type)

; Styling of the function access

(function_access) @variable.member

((function_access) @string
	(#eq? @string "public"))

((function_access) @constant
	(#eq? @constant "private"))

; Special identifiers
;--------------------

((identifier) @constructor
 (#match? @constructor "^[A-Z]"))

([
    (identifier)
    (shorthand_property_identifier)
    (shorthand_property_identifier_pattern)
 ] @constant
 (#match? @constant "^[A-Z_][A-Z\\d_]+$"))

((identifier) @keyword.conditional
 (#match? @keyword.conditional "^(arguments|local|variables|session|request|application)$"))

((identifier) @function.builtin
 (#eq? @function.builtin "require"))

(parameter_type) @type
(return_type) @type
(return_type (identifier) @type)
 
(string (hash_expression) @markup.math)

; Literals
;---------

(this) @variable.builtin
(super) @variable.builtin

[
  (true)
  (false)
  (null)
  (undefined)
] @constant.builtin

(comment) @comment @spell

[
  (string)
  (template_string)
] @string

(regex) @string.special
(number) @number

; Tokens
;-------

[
  ";"
  (optional_chain)
  "."
  ","
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
  "<<"
  "<<="
  "="
  "=="
  "==="
  "!="
  "!=="
  "=>"
  ">"
  ">="
  ">>"
  ">>="
  ">>>"
  ">>>="
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
]  @punctuation.bracket

(template_substitution
  "${" @punctuation.special
  "}" @punctuation.special) @embedded

[
 "required"
] @character.special

[
  "as"
  "break"
  "case"
  "catch"
  "class"
  "const"
  "continue"
  "debugger"
  "default"
  "do"
  "else"
  "export"
  "extends"
  "finally"
  "for"
  "from"
  "function"
  "get"
  "if"
  "import"
  "in"
  "instanceof"
  "let"
  "new"
  "of"
  "return"
  "set"
  "static"
  "switch"
  "target"
  "throw"
  "try"
  "var"
  "while"
  "with"
  "yield"
] @keyword