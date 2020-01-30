<html>
<head>
<style>
main p a {
	color: #fff;
	font-size: 1.2em;
	text-decoration: underline;
}
#header {
  left: 0;
  float: left;
  width: auto;
  z-index: 1000;
}
#caret {
  display: inline-block;
  height: 7px;
  width: 7px;
  border-left: 3px solid #fff;
  border-bottom: 3px solid #fff;
  transform: rotate(-45deg) translateY(-4px);
}
body {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  margin: 0;
  font-family: 'Open Sans', sans-serif;
  background: #769bbe;
}
li, #trigger2, #trigger,#trigger_1 {
  top:0;
  list-style-type: none;
  display: inline-block;
  padding: 13px;
  color: #f2f2f2;
  transition: 0.2s;
}
ul {
  margin-top: 0;
  position: absolute;
  top: 0;
  background: #496E91;
  display: block;
  width: 100%;
  height: 3em;
  text-align: right;
  padding-left: 0;
  padding-right: 0;
}
#main {
  left: 0;
}
li:hover, #trigger2:hover {
  color: #496E91;
  background: #f2f2f2;
}
li:hover, #trigger_1:hover {
  color: #496E91;
  background: #f2f2f2;
}
#dropdown {
  top: 3em;
  background-color: #34526E;
  height: 0;
  overflow: hidden;
  width: auto;
  right: 11em;
/*  padding-left: 60px;
  padding-right: 10px;*/
  transition: 0.5s;
  z-index: 2000;
  text-align: left;
}
#dropdown1{
  top: 3em;
  background-color: #34526E;
  height: 0;
  overflow: hidden;
  width: auto;
  right: 3.1em;
  transition: 0.5s;
/*  padding-left: 50px;
  padding-right: 50px;*/
  z-index: 2000;
}
#dropdown li {
  display: block;
/*  padding-left: 0px;
  padding-right:0px;*/
  text-align: left;
  padding-left: 20px;
  padding-right: 0px;
}
#dropdown1 li {
  display: block;
  padding-left: 0px;
  padding-right: 0px;
  text-align: left;
}
a {
  text-decoration: none;
}
#dwn {
  font-size: 0.8em;
}
#trigger:hover + #dropdown, #dropdown:hover {
  height: 12em;
}
#trigger_1:hover + #dropdown1, #dropdown1:hover {
  height: 12em;
}
main {
  position: absolute;
  top: 2.8em;
}
main {
  width: 100%;
  text-align: center;
}
h1 {
  font-family: 'Slabo 27px', serif;
  font-size: 2.5em;
  color: #f2f2f2;
}
p {
  color: #f2f2f2;
  padding-left: 50px;
  padding-right: 50px;
}
a {
  color: #f2f2f2;
}
#trigger:hover {
  color: #496E91;
}
#trigger_1:hover {
  color: #496E91;
}
.x1 {
  position: relative;
  top: -0.8em;
}
.x2 {
  position: relative;
  top: -0.8em;
}
#src {
  text-decoration: underline;
}
#src:hover {
  text-decoration: none;
}
#trigger2 {
  display: none !important;
}
#x7 {
  left: 999999px;
  
}
@media (max-width: 627px) {
  #header {
    width: 100%;
  }
  #brand {
    position: absolute;
    top: 0;
    left: 0;
  }
  #main {
    height: 0;
    overflow: hidden;
    z-index: 3000;
    top: 3em;
    text-align: left;
    transition: 0.5s;
  }
  #main li, #trigger {
    display: block;
  }
  #dropdown {
    position: static;
  }
  #trigger2 {
    display: inline-block !important;
    position: absolute;
    top: 0;
    right: 0;
    cursor: pointer;
  }
  #x7:checked + #main {
    height: auto;
    padding-top: 1em;
  }
  #dropdown {
    position: relative;
    top: -1.6em !important;
    right: 0em;
    width: 100%;
  }
}


</style>
<body>
<link rel="stylesheet" href="//cdn.jsdelivr.net/fontawesome/4.2.0/css/font-awesome.min.css" />
<link href='https://fonts.googleapis.com/css?family=Slabo+27px|Open+Sans' rel='stylesheet' type='text/css'>
<nav>
  <ul id="header">
    <a href="#" id="brand">
      <li>
    Dropdown
      </li>
    </a>
    <label id="trigger2" for="x7"><i class="fa fa-bars"></i></label>
  </ul>
  <input type="checkbox" id="x7" />
  
  <ul id="main">
<!--    <a href="#">
      <li class="x1">
        Link 1
      </li>
    </a>
    <a href="#">
      <li class="x1">
        Link 2
      </li>
    </a>
    <a href="#">
      <li class="x1">
        Link 3
      </li>
    </a>-->
      
    <a href="#" id="trigger">
      <li class="x1">
        Dropdown&nbsp;
        <span id="caret"></span>
      </li>
    </a>
    <ul id="dropdown">
      <a href="#">
        <li>
          Link 2
        </li>
      </a>
      
    </ul> 
        
        <a href="#" id="trigger_1">
      <li class="x1">
        Dropdown&nbsp;
        <span id="caret"></span>
      </li>
    </a>
    <ul id="dropdown1">
      <a href="#">
        <li>Link 1</li>
      </a>
    </ul>
  </ul>
</nav>
</body>
</html>
