<%-- 
    Document   : dash
    Created on : 28 Jan, 2020, 5:16:44 PM
    Author     : AV-IT-PC408
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            /* RESET RULES & HELPER CLASSES
–––––––––––––––––––––––––––––––––––––––––––––––––– */
            :root {
                --purple-1: #3d174f;
                --purple-2: #4b2860;
                --white: #fff;
                --black: #221f1f;
                --red: #ed1849;
                --lightgray: #cfcfcf;
                --overlay: rgba(0, 0, 0, 0.5);
            }

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                outline: none;
            }

            html {
                font-size: 62.5%;
            }

            button {
                background: transparent;
                border: none;
                cursor: pointer;
            }

            ul {
                list-style: none;
            }

            a {
                text-decoration: none;
            }

            img {
                display: block;
                max-width: 100%;
                height: auto;
            }

            a,
            button {
                color: inherit;
            }

            .no-transition {
                transition: none !important;
            }

            body {
                font: 1.6rem/1.5 Roboto, sans-serif;
                color: var(--white);
                min-height: 100vh;
            }


            /* HEADER
            –––––––––––––––––––––––––––––––––––––––––––––––––– */
            .page-header {
                position: relative;
                padding: 1.5rem 3rem;
                background: var(--purple-1);
            }

            .page-header nav {
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            .page-header .horizontal-logo,
            .page-header .search span {
                display: none;
            }

            .page-header .vertical-logo {
                max-width: 9.5rem;
            }

            .page-header .top-menu-wrapper {
                color: var(--black);
            }

            .page-header .top-menu-wrapper::before {
                content: '';
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                z-index: -1;
                transition: background 0.5s;
            }

            .page-header .search {
                color: var(--white);
            }

            .page-header .panel,
            .page-header .top-menu {
                position: fixed;
                top: 0;
                left: 0;
                bottom: 0;
                z-index: 2;
                transform: translate3d(-100%, 0, 0);
                transition: transform 0.4s cubic-bezier(0.23, 1, 0.32, 1);
            }

            .page-header .panel1 {
                width: 100%;
                background: var(--purple-1);
                transition-delay: 0.3s;
            }

            .page-header .panel2 {
                width: calc(100% - 3rem);
                background: var(--red);
                transition-delay: 0.1s;
            }

            .page-header .top-menu {
                display: flex;
                flex-direction: column;
                width: calc(100% - 6rem);
                overflow-y: auto;
                padding: 2rem;
                background: var(--white);
            }

            .page-header .top-menu-wrapper.show-offcanvas::before {
                background: var(--overlay);
                z-index: 1;
            }

            .page-header .top-menu-wrapper.show-offcanvas .panel,
            .page-header .top-menu-wrapper.show-offcanvas .top-menu {
                transform: translate3d(0, 0, 0);
                transition-duration: 0.7s;
            }

            .page-header .top-menu-wrapper.show-offcanvas .panel1 {
                transition-delay: 0s;
            }

            .page-header .top-menu-wrapper.show-offcanvas .panel2 {
                transition-delay: 0.2s;
            }

            .page-header .top-menu-wrapper.show-offcanvas .top-menu {
                transition-delay: 0.4s;
                box-shadow: rgba(0, 0, 0, 0.25) 0 0 4rem 0.5rem;
            }


            /* FORM
            –––––––––––––––––––––––––––––––––––––––––––––––––– */
            .page-header .search-form {
                position: absolute;
                top: 100%;
                left: 0;
                right: 0;
                visibility: hidden;
                opacity: 0;
                padding: 1rem 0;
                background: var(--purple-2);
                transition: all 0.2s;
            }

            .page-header .search-form.is-visible {
                visibility: visible;
                opacity: 1;
            }

            .page-header .search-form div {
                position: relative;
                width: 90%;
                max-width: 1000px;
                margin: 0 auto;
            }

            .page-header .search-form input {
                width: 100%;
                font-size: 2rem;
                height: 4rem;
                padding: 0 2rem;
            }

            .page-header .search-form button {
                position: absolute;
                right: 2rem;
                top: 50%;
                transform: translateY(-50%);
                color: var(--purple-1);
            }


            /* TOP MENU
            –––––––––––––––––––––––––––––––––––––––––––––––––– */
            .page-header .top-menu li + li {
                margin-top: 1.5rem;
            }

            .page-header .top-menu > li:last-child {
                margin-top: auto;
            }

            .page-header ul a {
                display: inline-block;
                font-size: 1.3rem;
                text-transform: uppercase;
                transition: color 0.35s ease-out;
            }

            .page-header ul a:hover {
                color: var(--red);
            }

            .page-header .has-dropdown i {
                display: none;
            }

            .page-header .sub-menu {
                padding: 1.5rem 2rem 0;
            }

            .page-header .top-menu .mob-block {
                display: flex;
                align-items: center;
                justify-content: space-between;
                margin-bottom: 3rem;
            }

            .page-header .top-menu .mob-block i {
                color: var(--lightgray);
            }

            .page-header .socials {
                display: flex;
                margin-top: 3rem;
                /* some browsers ignore the padding-bottom: 2rem of the .top-menu because it has overflow-y:auto
                https://bugzilla.mozilla.org/show_bug.cgi?id=748518
                so we add a bottom margin to the .socials
                */
                margin-bottom: 1rem; 
            }

            .page-header .socials li + li {
                margin-top: 0;
            }

            .page-header .socials .fa-stack {
                font-size: 1.7rem;
            }

            .page-header .socials .fab {
                font-size: 1.2rem;
            }


            /* FOOTER
            –––––––––––––––––––––––––––––––––––––––––––––––––– */
            .page-footer {
                position: absolute;
                bottom: 1rem;
                right: 1rem;
                font-size: 1.3rem;
                color: var(--black);
            }

            .page-footer span {
                color: #e31b23;
            }


            /* MQ
            –––––––––––––––––––––––––––––––––––––––––––––––––– */
            @media screen and (min-width: 550px) {
                .page-header .panel1 {
                    width: 60%;
                }
                .page-header .panel2 {
                    width: calc(60% - 3rem);
                }
                .page-header .top-menu {
                    width: calc(60% - 6rem);
                }
            }

            @media screen and (min-width: 768px) {
                .page-header .top-menu {
                    padding: 4rem;
                }

                .page-header ul a {
                    font-size: 1.6rem;
                }

                .page-header .search-form input {
                    font-size: 2.4rem;
                    height: 5rem;
                    line-height: 5rem;
                }
            }

            @media screen and (min-width: 995px) {
                .page-header {
                    padding: 0 3rem;
                }

                .page-header .panel,
                .page-header .open-mobile-menu,
                .page-header .vertical-logo,
                .page-header .top-menu .mob-block,
                .page-header .top-menu > li:last-child,
                .page-header .top-menu-wrapper::before {
                    display: none;
                }

                .page-header .horizontal-logo {
                    display: block;
                }

                .page-header .top-menu-wrapper {
                    display: flex;
                    align-items: center;
                    color: var(--white);
                }

                .page-header .top-menu {
                    flex-direction: row;
                    position: static;
                    width: auto;
                    background: transparent;
                    transform: none;
                    padding: 0;
                    overflow-y: visible;
                    box-shadow: none !important;
                }

                .page-header .top-menu li + li {
                    margin-top: 0;
                }

                .page-header .top-menu > li:not(:nth-last-child(2)) {
                    margin-right: 3rem;
                }

                .page-header .top-menu > li > a {
                    padding: 3rem 0.5rem;
                }

                .page-header ul a {
                    font-size: 1.3rem;
                }

                .page-header .has-dropdown i {
                    display: inline-block;
                }

                .page-header .sub-menu {
                    display: none;
                    position: absolute;
                    top: 100%;
                    left: 50%;
                    transform: translateX(-50%);
                    padding: 1.5rem 2rem;
                    background: var(--purple-2);
                }

                .page-header .sub-menu li + li {
                    margin-top: 1.2rem;
                }

                .page-header .sub-menu a {
                    padding: 0.5rem 1rem;
                    white-space: nowrap;
                }

                .page-header .has-dropdown {
                    position: relative;
                }

                .page-header .has-dropdown:hover .sub-menu {
                    display: block;
                }

                .page-header .search {
                    display: flex;
                    align-items: center;
                    margin-left: 3rem;
                }
            }

            @media screen and (min-width: 1200px) {
                .page-header .search {
                    margin-left: 5rem;
                }

                .page-header .search i {
                    margin-right: 1.5rem;
                }

                .page-header .search span {
                    display: block;
                    font-weight: 500;
                    font-size: 1.6rem;
                }
            }
        </style>
        <script>
            const pageHeader = document.querySelector(".page-header");
            const openMobMenu = document.querySelector(".open-mobile-menu");
            const closeMobMenu = document.querySelector(".close-mobile-menu");
            const toggleSearchForm = document.querySelector(".search");
            const searchForm = document.querySelector(".page-header form");
            const topMenuWrapper = document.querySelector(".top-menu-wrapper");
            const isVisible = "is-visible";
            const showOffCanvas = "show-offcanvas";
            const noTransition = "no-transition";
            let resize;

            openMobMenu.addEventListener("click", () => {
                topMenuWrapper.classList.add(showOffCanvas);
            });

            closeMobMenu.addEventListener("click", () => {
                topMenuWrapper.classList.remove(showOffCanvas);
            });

            toggleSearchForm.addEventListener("click", () => {
                searchForm.classList.toggle(isVisible);
            });

            window.addEventListener("resize", () => {
                pageHeader.querySelectorAll("*").forEach(function (el) {
                    el.classList.add(noTransition);
                });
                clearTimeout(resize);
                resize = setTimeout(resizingComplete, 500);
            });

            function resizingComplete() {
                pageHeader.querySelectorAll("*").forEach(function (el) {
                    el.classList.remove(noTransition);
                });
            }
            
        </script>
    </head>
    <body>
        <header class="page-header">
            <nav>
                <button aria-label="Open Mobile Menu" class="open-mobile-menu fa-lg">
                    <i class="fas fa-bars" aria-hidden="true"></i>
                </button>
                <a href="">
                    <img class="logo horizontal-logo" src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/162656/horizontal-logo.svg" alt="forecastr logo">
                    <img class="logo vertical-logo" src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/162656/vertical-logo.svg" alt="forecastr logo">
                </a>
                <div class="top-menu-wrapper">
                    <div class="panel panel1"></div>
                    <div class="panel panel2"></div>
                    <ul class="top-menu">
                        <li class="mob-block">
                            <img class="logo" src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/162656/horizontal-logo-mobile.svg" alt="forecastr horizontal mobile logo">
                            <button aria-label="Close Mobile Menu" class="close-mobile-menu fa-lg">
                                <i class="fas fa-times" aria-hidden="true"></i>
                            </button>
                        </li>
                        <li>
                            <a href="">Product</a>
                        </li>
                        <li>
                            <a href="">Solutions</a>
                        </li>
                        <li class="has-dropdown">
                            <a href="">
                                Why forecastr 
                                <i class="fas fa-chevron-down"></i>   
                            </a>
                            <ul class="sub-menu">
                                <li>
                                    <a href="">About</a>
                                </li>
                                <li>
                                    <a href="">Partners</a>
                                </li>
                                <li>
                                    <a href="">Success Stories</a>
                                </li>
                                <li>
                                    <a href="">Testimonials</a>
                                </li>
                            </ul>
                        </li>
                        <li class="has-dropdown">
                            <a href="">
                                Contact
                                <i class="fas fa-chevron-down"></i>   
                            </a>
                            <ul class="sub-menu">
                                <li>
                                    <a href="">Request a Demo</a>
                                </li>
                                <li>
                                    <a href="">Send an Email</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <ul class="socials">
                                <li>
                                    <a href="">
                                        <span class="fa-stack fa-2x">
                                            <i class="fas fa-circle fa-stack-2x"></i>
                                            <i class="fab fa-facebook fa-stack-1x fa-inverse"></i>
                                        </span>
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <span class="fa-stack fa-2x">
                                            <i class="fas fa-circle fa-stack-2x"></i>
                                            <i class="fab fa-twitter fa-stack-1x fa-inverse"></i>
                                        </span>
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <span class="fa-stack fa-2x">
                                            <i class="fas fa-circle fa-stack-2x"></i>
                                            <i class="fab fa-instagram fa-stack-1x fa-inverse"></i>
                                        </span>
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <span class="fa-stack fa-2x">
                                            <i class="fas fa-circle fa-stack-2x"></i>
                                            <i class="fab fa-youtube fa-stack-1x fa-inverse"></i>
                                        </span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <button class="search">
                        <i class="fas fa-search fa-lg"></i>
                        <span>Search Resources</span>
                    </button>
                    <form class="search-form">
                        <div>
                            <input type="search" placeholder="Search Resources">
                            <button aria-label="Search Resources" type="submit">
                                <i class="fas fa-search fa-2x" aria-hidden="true"></i>  
                            </button>
                        </div>
                    </form>
                </div>
            </nav>
        </header>
        <footer class="page-footer">
           Copyrights &COPY; 2020 All Rights are reserved
        </footer>
    </body>
</html>
