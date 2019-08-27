%########################################################################
%# Copyright (c) 1988-2019 $organization$
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
%#   File: vcversion-vsprops.t
%#
%# Author: $author$
%#   Date: 8/3/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_XmlEncoding,%(%else-then(%is_XmlEncoding%,%()%)%)%,%
%XmlEncoding,%(%else-then(%XmlEncoding%,%(Windows-1252)%)%)%,%
%File,%(%else-then(%File%,%(vcversion)%)%)%,%
%is_Base,%(%else-then(%is_Base%,%()%)%)%,%
%Base,%(%else-then(%Base%,%(%else-then(%filebase(%File%)%,%File%)%)%)%)%,%
%is_Extension,%(%else-then(%is_Extension%,%()%)%)%,%
%Extension,%(%else-then(%Extension%,%(%else-then(%fileextension(%File%)%,%(vsprops)%)%)%)%)%,%
%is_VCVersion,%(%else-then(%is_VCVersion%,%()%)%)%,%
%VCVersion,%(%else-then(%VCVersion%,%(vc9)%)%)%,%
%%(%
%%include(%include_path%/file-xml.t)%%
%<VisualStudioPropertySheet
    ProjectType="Visual C++"
    Version="8.00"
    Name="%Base%">

    <!--
    =====================================================================
    =====================================================================
    -->

    <UserMacro
        Name="VCVersion"
        Value="%VCVersion%"
    />

    <!--
    =====================================================================
    =====================================================================
    -->

</VisualStudioPropertySheet>
%
%)%)%%