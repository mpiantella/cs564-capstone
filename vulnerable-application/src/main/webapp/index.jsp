<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://unpkg.com/tailwindcss@2.2.4/dist/tailwind.min.css" rel="stylesheet">
</head>
<body>
<div class="h-screen flex">
    <div class="flex w-1/2 justify-center items-center bg-white">
        <form class="bg-white" method="POST" action="/login">
            <h1 class="text-gray-800 font-bold text-2xl mb-1">We start here</h1>
            <p class="text-sm font-normal text-gray-600 mb-7">Welcome Back</p>
                <input class="pl-2 outline-none border-none" type="text" name="uname" placeholder="Username" />
                <input class="pl-2 outline-none border-none" type="text" name="password" placeholder="Password" />
            <button type="submit" class="block w-full bg-indigo-600 mt-4 py-2 rounded-2xl text-white font-semibold mb-2">Login</button>
            <span class="text-sm ml-2 hover:text-blue-500 cursor-pointer">Forgot Password ?</span>
        </form>
    </div>
</div>
</body>
</html>
