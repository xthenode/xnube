%########################################################################
%# Copyright (c) 1988-2020 $organization$
%#
%# This software is provided by the author and contributors ``as is'' 
%# and any express or implied warranties, including, but not limited to, 
%# the implied warranties of merchantability and fitness for a particular 
%# purpose are disclaimed. In no event shall the author or contributors 
%# be liable for any direct, indirect, incidental, special, exemplary, 
%# or consequential damages (including, but not limited to, procurement 
%# of substitute goods or services; loss of use, data, or profits; or 
%# business interruption) however caused and on any theory of liability, 
%# whether in contract, strict liability, or tort (including negligence 
%# or otherwise) arising in any way out of the use of this software, 
%# even if advised of the possibility of such damage.
%#
%#   File: Xthenode-create-html.t
%#
%# Author: $author$
%#   Date: 2/16/2020
%########################################################################
%with(%
%is_include_path,%(%else-then(%is_include_path%,%(%is_Include_path%)%)%)%,%
%include_path,%(%else-then(%if-no(%is_include_path%,,%(%include_path%)%)%,%(%if-no(%is_include_path%,,%(%filepath(%input%)%)%)%)%)%)%,%
%Include_path,%(%else-then(%if-no(%is_include_path%,,%(%Include_path%)%)%,%(%if-no(%is_include_path%,,%(%include_path%)%)%)%)%)%,%
%INCLUDE_PATH,%(%else-then(%INCLUDE_PATH%,%(%toupper(%Include_path%)%)%)%)%,%
%include_path,%(%else-then(%_include_path%,%(%tolower(%Include_path%)%)%)%)%,%
%is_xmlversion,%(%else-then(%is_xmlversion%,%(%is_XmlVersion%)%)%)%,%
%xmlversion,%(%else-then(%if-no(%is_xmlversion%,,%(%xmlversion%)%)%,%(%if-no(%is_xmlversion%,,%(1.0)%)%)%)%)%,%
%XmlVersion,%(%else-then(%if-no(%is_xmlversion%,,%(%XmlVersion%)%)%,%(%if-no(%is_xmlversion%,,%(%xmlversion%)%)%)%)%)%,%
%XMLVERSION,%(%else-then(%XMLVERSION%,%(%toupper(%XmlVersion%)%)%)%)%,%
%xmlversion,%(%else-then(%_xmlversion%,%(%tolower(%XmlVersion%)%)%)%)%,%
%is_xmlencoding,%(%else-then(%is_xmlencoding%,%(%is_XmlEncoding%)%)%)%,%
%xmlencoding,%(%else-then(%if-no(%is_xmlencoding%,,%(%xmlencoding%)%)%,%(%if-no(%is_xmlencoding%,,%(utf-8)%)%)%)%)%,%
%XmlEncoding,%(%else-then(%if-no(%is_xmlencoding%,,%(%XmlEncoding%)%)%,%(%if-no(%is_xmlencoding%,,%(%xmlencoding%)%)%)%)%)%,%
%XMLENCODING,%(%else-then(%XMLENCODING%,%(%toupper(%XmlEncoding%)%)%)%)%,%
%xmlencoding,%(%else-then(%_xmlencoding%,%(%tolower(%XmlEncoding%)%)%)%)%,%
%is_organization,%(%else-then(%is_organization%,%(%is_Organization%)%)%)%,%
%organization,%(%else-then(%if-no(%is_organization%,,%(%organization%)%)%,%(%if-no(%is_organization%,,%($organization$)%)%)%)%)%,%
%Organization,%(%else-then(%if-no(%is_organization%,,%(%Organization%)%)%,%(%if-no(%is_organization%,,%(%organization%)%)%)%)%)%,%
%ORGANIZATION,%(%else-then(%ORGANIZATION%,%(%toupper(%Organization%)%)%)%)%,%
%organization,%(%else-then(%_organization%,%(%tolower(%Organization%)%)%)%)%,%
%is_author,%(%else-then(%is_author%,%(%is_Author%)%)%)%,%
%author,%(%else-then(%if-no(%is_author%,,%(%author%)%)%,%(%if-no(%is_author%,,%($author$)%)%)%)%)%,%
%Author,%(%else-then(%if-no(%is_author%,,%(%Author%)%)%,%(%if-no(%is_author%,,%(%author%)%)%)%)%)%,%
%AUTHOR,%(%else-then(%AUTHOR%,%(%toupper(%Author%)%)%)%)%,%
%author,%(%else-then(%_author%,%(%tolower(%Author%)%)%)%)%,%
%is_name,%(%else-then(%is_name%,%(%is_Name%)%)%)%,%
%name,%(%else-then(%if-no(%is_name%,,%(%name%)%)%,%(%if-no(%is_name%,,%(html)%)%)%)%)%,%
%Name,%(%else-then(%if-no(%is_name%,,%(%Name%)%)%,%(%if-no(%is_name%,,%(%name%)%)%)%)%)%,%
%NAME,%(%else-then(%NAME%,%(%toupper(%Name%)%)%)%)%,%
%name,%(%else-then(%_name%,%(%tolower(%Name%)%)%)%)%,%
%is_file,%(%else-then(%is_file%,%(%is_File%)%)%)%,%
%file,%(%else-then(%if-no(%is_file%,,%(%file%)%)%,%(%if-no(%is_file%,,%(%Name%)%)%)%)%)%,%
%File,%(%else-then(%if-no(%is_file%,,%(%File%)%)%,%(%if-no(%is_file%,,%(%file%)%)%)%)%)%,%
%FILE,%(%else-then(%FILE%,%(%toupper(%File%)%)%)%)%,%
%file,%(%else-then(%_file%,%(%tolower(%File%)%)%)%)%,%
%is_base,%(%else-then(%is_base%,%(%is_Base%)%)%)%,%
%base,%(%else-then(%if-no(%is_base%,,%(%base%)%)%,%(%if-no(%is_base%,,%(%filebase(%File%)%)%)%)%)%)%,%
%Base,%(%else-then(%if-no(%is_base%,,%(%Base%)%)%,%(%if-no(%is_base%,,%(%base%)%)%)%)%)%,%
%BASE,%(%else-then(%BASE%,%(%toupper(%Base%)%)%)%)%,%
%base,%(%else-then(%_base%,%(%tolower(%Base%)%)%)%)%,%
%is_extension,%(%else-then(%is_extension%,%(%is_Extension%)%)%)%,%
%extension,%(%else-then(%if-no(%is_extension%,,%(%extension%)%)%,%(%if-no(%is_extension%,,%(%else-then(%fileextension(%File%)%,%(html)%)%)%)%)%)%)%,%
%Extension,%(%else-then(%if-no(%is_extension%,,%(%Extension%)%)%,%(%if-no(%is_extension%,,%(%extension%)%)%)%)%)%,%
%EXTENSION,%(%else-then(%EXTENSION%,%(%toupper(%Extension%)%)%)%)%,%
%extension,%(%else-then(%_extension%,%(%tolower(%Extension%)%)%)%)%,%
%%(%
%%include(%Include_path%/file-html.t)%%
%<html>
    <!--
    =====================================================================
    === head
    =====================================================================
    -->
    <head>
        <title>Xthenode - Create%then-if(%What%, )%</title>

        <!--
        =====================================================================
        === style
        =====================================================================
        -->
        <link rel="stylesheet" type="text/css" href="../css/Xthenode.css"></link>
        <link rel="stylesheet" type="text/css" href="../css/Xthenode-header.css"></link>
        <link rel="stylesheet" type="text/css" href="../css/Xthenode-dropdown.css"></link>
        <link rel="stylesheet" type="text/css" href="../css/Xthenode-menubar.css"></link>
        <link rel="stylesheet" type="text/css" href="../css/Xthenode-logo.css"></link>
        <style type="text/css">
        </style>
    
        <!--
        =====================================================================
        === script
        =====================================================================
        -->
        <script type="text/javascript" src="../js/Xthenode.js"></script>
        <script type="text/javascript">
            onLocationInit('Xthenode.html', '%Base%%then-if(%Extension%,.)%');
        </script>
    </head>
    <!--
    =====================================================================
    === body
    =====================================================================
    -->
    <body class="body">

        <!--
        =====================================================================
        === logo
        =====================================================================
        -->
        <div id="includeLogo" include="Xthenode-logo.html">
            <script>includeHTML('includeLogo');</script>
        </div>
        <!--
        =====================================================================
        === header
        =====================================================================
        -->
        <div id="includeHeader" include="Xthenode-header.html">
            <script>includeHTML('includeHeader');</script>
        </div>
        <!--
        =====================================================================
        === dropdown
        =====================================================================
        -->
        <div id="includeDropdown" include="Xthenode-dropdown.html">
            <script>includeHTML('includeDropdown');</script>
        </div>
        <!--
        =====================================================================
        === popdown
        =====================================================================
        -->
        <div id="includePopdown" include="Xthenode-popdown.html">
            <script>includeHTML('includePopdown');</script>
        </div>
        <!--
        =====================================================================
        === menubar
        =====================================================================
        -->
        <ul class="menubar">
            <li><a href="%Base%%then-if(%Extension%,.)%">Create%then-if(%What%, )%</a></li>
            <li><a href="Xthenode.html">Home</a></li>
        </ul>

        <!--
        =====================================================================
        === form
        =====================================================================
        -->
        <form name="Form" method="POST" action="../templates/t%then-if(%Extension%,/)%/%Base%%then-if(%Extension%,-)%.t"
         onSubmit="return setFormSubmit(getFormValue2('FormTemplate','FormAction','Form'),getFormValue('FormMethod','Form'),'Form')">
            <div class="form">

            File: <input name="File" value=""></input>[%Name%][%then-if(%Extension%,.)%]
            <input type="checkbox" name="is_File" value="no" unchecked="checked">no</input>
            <br/>
            Template: <select name="FormTemplate">
            <option value="../templates/t%then-if(%Extension%,/)%/%Base%%then-if(%Extension%,-)%.t">Create%then-if(%What%, )%</option>
            <option value=""></option>
            <option value="../templates/t/t/functions.t">t functions</option>
            <option value="../templates/t/t/parameters.t">t parameters</option>
            <option value=""></option>
            <option value="/xthenode-cgi/cgi">cgi parameters</option>
            <option value="/xthenode-cgi/cgicatch">catch cgi parameters</option>
            </select>
            <br/>%then-if(%include(%Include_path%/Xthenode-form-fields-html.t)%,%(
            
            <br/>)%)%

            <br/>
            Content-Type: <select name="content_type">
            <option value="text/plain">text</option>
            <option value="text/html">html</option>
            <option value="text/xml">xml</option>
            <option value="application/json">json</option>
            <option value="application/javascript">javascript</option>
            <option value=""></option>
            </select><br/>
            Action: <select name="FormAction">
            <option value="../templates/t%then-if(%Extension%,/)%/%Base%%then-if(%Extension%,-)%.t">Create%then-if(%What%, )%</option>
            <option value=""></option>
            <option value="../templates/t/t/functions.t">t functions</option>
            <option value="../templates/t/t/parameters.t">t parameters</option>
            <option value=""></option>
            <option value="/xthenode-cgi/cgi">cgi parameters</option>
            <option value="/xthenode-cgi/cgicatch">catch cgi parameters</option>
            </select><br/>
            Method: <select name="FormMethod">
            <option value="POST">POST</option>
            <option value="GET">GET</option>
            <option value=""></option>
            </select><br/><br/>

            <input type="submit" name="submit" value="submit"/><br/>
            </div>
        </form>
    </body>
</html>
%
%)%)%