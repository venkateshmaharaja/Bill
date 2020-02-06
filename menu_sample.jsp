<html>
    <head>
        <style>
            body {
                font-family: 'Lato', sans-serif;
                margin: 0px;
            }
            .navbar {
                overflow: hidden;
                background: #0275d8;
            }
            .navbar a {
                float: left;
                display: block;
                color: #fff;
                text-align: center;
                font-size: 15px;
                padding: 20px 20px;
                text-decoration: none;
            }
            .navbar a:hover {
                font-weight: bolder;
                
            }
            .navbar .icon {
                display: none;
            }
            .logo{
                position: relative;
                width: auto;
                height: auto;
                padding: 20px 20px;
                display: inline-block;
            }
            .dropdown {
                float: right;
                overflow: hidden;
            }
            .dropdown .drop {
                font-size: 16px; 
                border: none;
                outline: none;
                color: #fff;
                padding: 20px 20px;
                background-color: inherit;
                font-family: inherit;
                margin: 0;
            }
            .drop .fa-angle-double-up,
            .drop:hover .fa-angle-double-down {
                display: none;
            }
            .drop:hover .fa-angle-double-up {
                display: inline;
            }
            .drop-content {
                display: none;
                position: absolute;
                background-color: #404040;
                min-width: 150px;
                z-index: 1;
                border-radius: 8px;
            }
            .drop-content a {
                float: none;
                color: black;
                padding: 20px, 16px;
                text-decoration: none;
                display: block;
                text-align: left;
            }
            .dropdown:hover .drop-content {
                display: block;
                top: 58px;
                background-color: #e9ecef;
            }
            .drop-content a:hover {
                background-color: #FFFFFF;
                color: black;
            }
            @media screen and (max-width: 768px) {
                .navbar a {
                    display: none;
                }
                .navbar a.icon {
                    float: right;
                    display: block;
                }
                .logo{
                    display: none;
                    float: left;
                    display: block;
                }

            }
            @media screen and (max-width: 768px) {
                .logo{
                    display: none;
                }
                .navbar.responsive {
                    position: relative;
                }
                .navbar.responsive a.icon {
                    position: absolute;
                    right: 0;
                    top: 0;
                }
                .logo{
                   /*display: none;*/
                }
                .navbar.responsive a {
                    float: none;
                    display: block;
                    text-align: left;
                    padding-left: 10px;
                    border-top: 1px solid #fff;

                }
                .navbar.responsive .dropdown {
                    float: none;
                }
                .navbar.responsive .drop-content {
                    position: relative;
                    top:0px;
                    padding-left: 20px;
                    padding-right: 20px;
                    background-color: #fff;
                    border-radius: 20px;
                }
                .navbar.responsive .drop-content a {
                    border-top: 1px solid #FFFFFF;
                }
                .navbar.responsive .dropdown .drop {
                    display: block;
                    width: 100%;
                    text-align: left;
                    border-top: 1px solid #fff;
                }
                .navbar.responsive .dropdown .drop:hover {
                    background-color: #496E91;
                }
            }
        </style>
        <script>
            function displayMenu() {
                var x = document.getElementById("nav");
                if (x.className === "navbar") {
                    x.className += " responsive";
                } else {
                    x.className = "navbar";
                }
            }
        </script>
        <title>BILLING</title>
        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0/css/all.min.css">

    </head>
    <body>

        <div class="navbar" id= "nav">
            <a href="#Home">Home</a>
            <a class="logo" style="color:whitesmoke;font-size: 18px;font-weight: bolder;">AMUL PRODUCTS<i class="fal fa-cow"></i></a>
            <div class="dropdown">
                <a class="drop" href="#Home">Accounting 
                    <i class="fa fa-angle-double-down"></i>
                    <i class="fa fa-angle-double-up"></i>
                </a>
                <div class="drop-content">
                    <a href="#Prod1">Vendor</a>
                    <a href="#Prod2">Customer</a>
                    <a href="#Prod3">Purchase</a>
                    <a href="#Prod3">Sales</a>
                </div>
            </div>
            <div class="dropdown">
                <a class="drop" href="#Home">Inventory 
                    <i class="fa fa-angle-double-down"></i>
                    <i class="fa fa-angle-double-up"></i>
                </a>
                <div class="drop-content">
                    <a href="#Category">Category&emsp;<i class="fa fa-plus-circle"></i></a >
                    <a href="#Brand">Brand&emsp;&emsp;&nbsp;<i class="fa fa-plus-square"></i></a>
                    <a href="#Item">Item&emsp;&emsp;&emsp;<i class="fa fa-plus"></i></a>
                </div>
            </div>

            <a href="javascript:void(0);" class="icon" onclick="displayMenu()"><i class="fa fa-bars"></i></a>
        </div>

    </body>
</html>