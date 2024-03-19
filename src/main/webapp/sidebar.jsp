<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sidebar</title>
    <style>
        body, html {
            height: 100%;
            margin: 0;
            font-family: Arial, sans-serif;
        }

        aside {
            background-color: #17a2b8;
            color: #fff;
            padding-top: 60px; /* Adjust this value based on your header height */
            height: 100%;
            width: 200px;
            position: fixed;
            top: 0;
            left: 0;
            overflow-y: auto; /* Enable vertical scrolling if needed */
            z-index: 1000; /* Ensure the sidebar is above other content */
        }

        nav ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        nav ul li {
            padding: 10px;
        }

        nav ul li a {
            color: #fff;
            text-decoration: none;
            display: block;
        }

        nav ul li a:hover {
            background-color: #495057;
        }
    </style>
</head>
<body>

<aside>
    <nav>
        <ul>
            <li><a href="#">Menu Item 1</a></li>
            <li><a href="#">Menu Item 2</a></li>
            <li><a href="#">Menu Item 3</a></li>
        </ul>
    </nav>
</aside>

</body>
</html>
