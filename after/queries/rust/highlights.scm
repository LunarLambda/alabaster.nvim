;; vim: ft=query
;; extends

(struct_item
  name: (type_identifier) @AlabasterDefinition)
(enum_item
  name: (type_identifier) @AlabasterDefinition)

(impl_item
  type: (type_identifier) @AlabasterDefinition)

(impl_item
  type: (scoped_type_identifier
          path: (scoped_identifier)
          name: (type_identifier) @AlabasterDefinition))

(impl_item
  body: (declaration_list
          (type_item
            name: (type_identifier) @AlabasterDefinition)))
(impl_item
  type: (generic_type
          type: (type_identifier) @AlabasterDefinition))

(trait_item
  name: (type_identifier) @AlabasterDefinition)

(trait_item
  body: (declaration_list
          (associated_type
            name: (type_identifier) @AlabasterDefinition)))

(trait_item
  body: (declaration_list
          (function_signature_item
            name: (identifier) @AlabasterDefinition)))

(function_item
  name: (identifier) @AlabasterDefinition)

(macro_definition
  name: (identifier) @AlabasterDefinition)

(for_expression
  "in" @AlabasterPunctuation)

; Fixes
[
  (outer_doc_comment_marker)
  (inner_doc_comment_marker)
] @comment.documentation

; Resets
(enum_variant name: (identifier) @variable.member)

(scoped_identifier name: (identifier) @module)

(scoped_type_identifier name: (type_identifier) @module)

(attribute (identifier) @attribute.macro)

(field_expression (integer_literal) @variable.member)

; Definitions
(mod_item name: (identifier) @AlabasterDefinition)

; De-emphasized elements
[
  "await"
  "ref"
  "raw"
  (mutable_specifier)
  ".."
  "..="
  "..."
] @operator

; "Attention" elements
(unsafe_block "unsafe" @AlabasterAttention)

((mutable_specifier) [
  (identifier)
  (shorthand_field_identifier)
  (self)] @AlabasterAttention)

((identifier) @AlabasterAttention (#eq? @AlabasterAttention "_"))

"dyn" @AlabasterAttention

; Keywords
[
  "let"
  "return"
  "if"
  "else"
  "match"
  "break"
  "continue"
  "loop"
  "while"
] @constant

(for_expression "for" @constant)
