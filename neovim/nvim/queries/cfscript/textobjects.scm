; Function

(function_declaration) @function.outer

(function_declaration body: (_
	.
    "{"
    .
    (_) @_start
    (_)? @_end
    .
    "}"
) (#make-range! "function.inner" @_start @_end))


; Class

(program) @class.outer


; Comment

(comment) @comment.outer


; Assignment

(assignment_expression) @assignment.outer
(assignment_expression right: (_) @assignment.inner)

(assignment_expression left: (_) @assignment.lhs)
(assignment_expression right: (_) @assignment.rhs)


; Unit test specs

; describe blocks
(expression_statement
  (call_expression
	function: (identifier) @func_name (#match? @func_name "^describe$")
	arguments: (arguments
		[(assignment_expression right: (function_expression body: (_
			.
			"{"
			.
			(_) @_start
			(_)? @_end
			.
			"}"
		) (#make-range! "spec.inner" @_start @_end)))
		(function_expression body: (_
			.
			"{"
			.
			(_) @_start
			(_)? @_end
			.
			"}"
		) (#make-range! "spec.inner" @_start @_end))])
	)) @spec.outer

; it blocks
(expression_statement
  (call_expression
	function: (identifier) @func_name (#match? @func_name "^it$")
	arguments: (arguments
		[(assignment_expression right: (function_expression body: (_
			.
			"{"
			.
			(_) @_start
			(_)? @_end
			.
			"}"
		) (#make-range! "test.inner" @_start @_end)))
		(function_expression body: (_
			.
			"{"
			.
			(_) @_start
			(_)? @_end
			.
			"}"
		) (#make-range! "test.inner" @_start @_end))])
	)) @test.outer
