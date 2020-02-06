<html>
    <head>
        <style>
            body {
                font-family: 'Lato', sans-serif;
                margin: 0px;
            }
            .mnu {
                overflow: hidden;
                background: #0275d8;
            }
            .mnu a {
                float: left;
                display: block;
                color: #fff;
                text-align: center;
                font-size: 15px;
                padding: 20px 20px;
                text-decoration: none;
            }
            .mnu a:hover {
                font-weight: bolder;
                
            }
            .mnu .icon {
                display: none;
            }
            .logo{
                position: relative;
                width: auto;
                height: auto;
                padding: 20px 20px;
                display: inline-block;
            }
            .ddown {
                float: right;
                overflow: hidden;
            }
            .ddown .drop {
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
            .ddown:hover .drop-content {
                display: block;
                top: 58px;
                background-color: #e9ecef;
            }
            .drop-content a:hover {
                background-color: #FFFFFF;
                color: black;
            }
            @media screen and (max-width: 768px) {
                .mnu a {
                    display: none;
                }
                .mnu a.icon {
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
                .mnu.res {
                    position: relative;
                }
                .mnu.res a.icon {
                    position: absolute;
                    right: 0;
                    top: 0;
                }
                .logo{
                   /*display: none;*/
                }
                .mnu.res a {
                    float: none;
                    display: block;
                    text-align: left;
                    padding-left: 10px;
                    border-top: 1px solid #fff;

                }
                .mnu.res .ddown {
                    float: none;
                }
                .mnu.res .drop-content {
                    position: relative;
                    top:0px;
                    padding-left: 20px;
                    padding-right: 20px;
                    background-color: #fff;
                    border-radius: 20px;
                }
                .mnu.res .drop-content a {
                    border-top: 1px solid #FFFFFF;
                }
                .mnu.res .ddown .drop {
                    display: block;
                    width: 100%;
                    text-align: left;
                    border-top: 1px solid #fff;
                }
                .mnu.res .ddown .drop:hover {
                    background-color: #496E91;
                }
            }
        </style>
        <script>
            function displayMenu() {
                var x = document.getElementById("nav");
                if (x.className === "mnu") {
                    x.className += " res";
                } else {
                    x.className = "mnu";
                }
            }
        </script>
        <title>BILLING</title>
        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0/css/all.min.css">
        
<!--          <link rel="stylesheet" href="../bill/Bootstrap files/3.4.1/css/cardstyle.css">
        <link rel="stylesheet" href="../bill/Bootstrap files/3.4.1/css/dropdown.css">-->
        <link rel="stylesheet" href="../bill/Bootstrap files/3.4.1/css/bootstrap.min.css">
        <script src="../bill/Bootstrap files/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="../bill/Bootstrap files/3.4.1/js/bootstrap.min.js"></script>

    </head>
    <body>

        <div class="mnu" id= "nav">
            <a href="#Home">HOME</a>
            <a class="logo" style="color:whitesmoke;font-size: 18px;font-weight: bolder;">AMUL PRODUCTS<i class="fal fa-cow"></i></a>
            <div class="ddown">
                <a class="drop" href="#Home">ACCOUNTING 
                    <i class="fa fa-angle-double-down"></i>
                    <i class="fa fa-angle-double-up"></i>
                </a>
                <div class="drop-content">
                    <a href="#Vendor">Vendor&emsp;&emsp;<i class="fa fa-plus-square"></i></a>
                    <a href="#Customer">Customer&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-plus-square"></i></a>
                    <a href="#Purchase">Purchase&emsp;&nbsp;&nbsp;<i class="fa fa-plus-square"></i></a>
                    <a href="#Sales">Sales&emsp;&emsp;&emsp;&nbsp;<i class="fa fa-plus-square"></i></a>
                </div>
            </div>
            <div class="ddown">
                <a class="drop" href="#Home">INVENTORY 
                    <i class="fa fa-angle-double-down"></i>
                    <i class="fa fa-angle-double-up"></i>
                </a>
                <div class="drop-content">
                    <a href="#" data-toggle="modal" data-target="#Category">Category&emsp;<i class="fa fa-plus-circle"></i></a >
                    <a href="#" data-toggle="modal" data-target="#Brand">Brand&emsp;&emsp;&nbsp;&nbsp;<i class="fa fa-plus-circle"></i></a>
                    <a href="#" data-toggle="modal" data-target="#plants">Item&emsp;&emsp;&emsp;<i class="fa fa-plus-circle"></i></a>
                </div>
            </div>

            <a href="javascript:void(0);" class="icon" onclick="displayMenu()"><i class="fa fa-bars"></i></a>
        </div>

    </body>
</html>