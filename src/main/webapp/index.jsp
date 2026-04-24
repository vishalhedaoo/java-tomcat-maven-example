<html>
<head>
    <title>Deployment Success Dashboard</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #d4fc79, #96e6a1);
            text-align: center;
        }

        .container {
            margin-top: 100px;
            background: white;
            width: 60%;
            margin-left: auto;
            margin-right: auto;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.2);
        }

        .icon {
            font-size: 80px;
            color: green;
            animation: bounce 1.5s infinite;
        }

        h1 {
            color: #2e7d32;
            font-size: 38px;
        }

        p {
            font-size: 22px;
            color: #444;
        }

        .build {
            margin-top: 20px;
            font-size: 20px;
            color: #1976d2;
            font-weight: bold;
        }

        @keyframes bounce {
            0%, 100% { transform: translateY(0);}
            50% { transform: translateY(-10px);}
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="icon">✅</div>
        <h1>Deployment Successful!</h1>
        <p>Your application has been deployed successfully via Jenkins CI/CD Pipeline.</p>
        <div class="build">Build Status: SUCCESS</div>
    </div>
</body>
</html>
