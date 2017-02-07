# API Documentation

```
*GET https://learn-to-code-react.herokuapp.com/users/:username/todos.json*
Response body:
 { todos: [
   { id: Integer, username: String, name: String, completed: Boolean, created_at: String, updated_at: String }
 ]}
```

```
*PATCH https://learn-to-code-react.herokuapp.com/users/:username/todos/:id.json*
Request body:
 { todo: {
   { name: String (optional), completed: Boolean (optional) }
 }}
Response body (success):
 { todo:
   { id: Integer, username: String, name: String, completed: Boolean, created_at: String, updated_at: String }
 }
Response body (errors 404, 422):
 { errors: [String] }
```

```
*POST https://learn-to-code-react.herokuapp.com/users/:username/todos.json*
Request body:
 { todo: {
   { name: String }
 }}
Response body (success):
 { todo:
   { id: Integer, username: String, name: String, completed: Boolean, created_at: String, updated_at: String }
 }
Response body (errors 404, 422):
 { errors: [String] }
```
