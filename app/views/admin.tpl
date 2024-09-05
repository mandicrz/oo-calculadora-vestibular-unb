<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
</head>
<body>
    <h1>Admin Panel</h1>
    
    <h2>All Users</h2>
    <table border="1">
        <tr>
            <th>Username</th>
            <th>Email</th>
            <th>Password</th>
            <th>Actions</th>
        </tr>
        % for user in users:
        <tr>
            <td>{{ user.username }}</td>
            <td>{{ user.email }}</td>
            <td>{{ user.password }}</td>
            
            <td>
                <form action="/admin/edit_user" method="post" style="display:inline;">
                    <input type="hidden" name="username" value="{{ user.username }}">
                    <input type="text" name="new_username" placeholder="New Username">
                    <input type="email" name="new_email" placeholder="New Email">
                    <input type="password" name="new_password" placeholder="New Password">
                    <button type="submit">Edit</button>
                </form>
                
                <form action="/admin/remove_user" method="post" style="display:inline;">
                    <input type="hidden" name="username" value="{{ user.username }}">
                    <button type="submit">Remove</button>
                </form>
            </td>
        </tr>
        % end
    </table>
    
    <h2>Add New User</h2>
    <form action="/" method="post">
        <input type="hidden" name="action" value="register">
        <input type="text" name="username" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>
        <input type="email" name="email" placeholder="Email" required>
        <button type="submit">Add User</button>
    </form>
    
    <form action="/logout" method="post">
        <button type="submit">Logout</button>
    </form>
</body>
</html>
