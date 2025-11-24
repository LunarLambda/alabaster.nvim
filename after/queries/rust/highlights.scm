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
            name: (identifier) @AlabasterDefinition (#set! priority 105))))

(function_item
  name: (identifier) @AlabasterDefinition (#set! priority 105))

(macro_definition
  name: (identifier) @AlabasterDefinition (#set! priority 105))

(for_expression
  "in" @AlabasterPunctuation)

; Fixes
[
  (outer_doc_comment_marker)
  (inner_doc_comment_marker)
] @comment.documentation

; Resets
(enum_variant name: (identifier) @variable.member)

((scoped_identifier
  name: (identifier) @module)
  (#not-lua-match? @module "^[A-Z][A-Z%d_]*$"))

(scoped_type_identifier name: (type_identifier) @module)

(attribute (identifier) @attribute.macro)

(field_expression (integer_literal) @variable.member)

(lifetime (identifier) @attribute)

; Definitions
(mod_item name: (identifier) @AlabasterDefinition (#set! priority 105))

(type_item name: (type_identifier) @AlabasterDefinition)

; De-emphasized elements
((identifier) @operator
  (#lua-match? @operator "^_")
  (#not-has-parent? @operator
    scoped_identifier
    scoped_type_identifier
    const_item
    static_item))

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

[
  "dyn"
  "extern"
] @AlabasterAttention

; Keywords
[
  "move"
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

(async_block "async" @constant)

(closure_expression "async" @constant)
