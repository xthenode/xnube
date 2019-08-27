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
%#   File: vsprops-vsprops.t
%#
%# Author: $author$
%#   Date: 8/3/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%XmlEncoding,%(%else-then(%XmlEncoding%,%(Windows-1252)%)%)%,%
%is_Name,%(%else-then(%is_Name%,%()%)%)%,%
%Name,%(%else-then(%Name%,%(Framework)%)%)%,%
%NAME,%(%else-then(%NAME%,%(%toupper(%Name%)%)%)%)%,%
%name,%(%else-then(%_Name%,%(%tolower(%Name%)%)%)%)%,%
%is_Group,%(%else-then(%is_Group%,%()%)%)%,%
%Group,%(%else-then(%Group%,%(%if-no(%is_Group%,,%Name%)%)%)%)%,%
%GROUP,%(%else-then(%GROUP%,%(%toupper(%Group%)%)%)%)%,%
%group,%(%else-then(%_Group%,%(%tolower(%Group%)%)%)%)%,%
%is_Version,%(%else-then(%is_Version%,%()%)%)%,%
%Version,%(%else-then(%Version%,%(%if-no(%is_Version%,,0.0.0)%)%)%)%,%
%VERSION,%(%else-then(%VERSION%,%(%toupper(%Version%)%)%)%)%,%
%version,%(%else-then(%_Version%,%(%tolower(%Version%)%)%)%)%,%
%is_Depends,%(%else-then(%is_Depends%,%()%)%)%,%
%Depends,%(%else-then(%Depends%,%(Depends)%)%)%,%
%DEPENDS,%(%else-then(%DEPENDS%,%(%toupper(%Depends%)%)%)%)%,%
%depends,%(%else-then(%_Depends%,%(%tolower(%Depends%)%)%)%)%,%
%is_Source,%(%else-then(%is_Source%,%()%)%)%,%
%Source,%(%else-then(%Source%,%(source)%)%)%,%
%is_Build,%(%else-then(%is_Build%,%()%)%)%,%
%Build,%(%else-then(%Build%,%(build)%)%)%,%
%File,%(%else-then(%File%,%(%else-then(%Name%,%(vsprops)%)%)%)%)%,%
%is_Base,%(%else-then(%is_Base%,%()%)%)%,%
%Base,%(%else-then(%Base%,%(%else-then(%filebase(%File%)%,%File%)%)%)%)%,%
%is_Extension,%(%else-then(%is_Extension%,%()%)%)%,%
%Extension,%(%else-then(%Extension%,%(%else-then(%fileextension(%File%)%,%(vsprops)%)%)%)%)%,%
%%(%
%%include(%include_path%/file-xml.t)%%
%<VisualStudioPropertySheet
    ProjectType="Visual C++"
    Version="8.00"
    Name="%Name%">

    <!--
    =====================================================================
    =====================================================================
    -->

    <UserMacro
        Name="%NAME%_GROUP"
        Value="%if-then(%Group%,/)%"
    />
    <UserMacro
        Name="%NAME%_NAME"
        Value="%Name%"
    />
    <UserMacro
        Name="%NAME%_VERSION"
        Value="%then-if(%Version%,-)%"
    />

    <!--
    =====================================================================
    =====================================================================
    -->

    <UserMacro
        Name="%NAME%_DIR"
        Value="$(%NAME%_GROUP)$(%NAME%_NAME)$(%NAME%_VERSION)"
    />
    <UserMacro
        Name="%NAME%_SOURCE_DIR"
        Value="$(SOURCE_ROOT_DIR)/$(%NAME%_DIR%())%%then-if(%Source%,/)%"
    />
    <UserMacro
        Name="%NAME%_BUILD_DIR"
        Value="$(SOURCE_BUILD_DIR)/$(%NAME%_DIR%())%%then-if(%Build%,/)%"
    />

    <!--
    =====================================================================
    =====================================================================
    -->

    <UserMacro
        Name="%NAME%_BUILD"
        Value="$(%NAME%_BUILD_DIR)/$(PlatformName)/$(VCVersion)/$(ConfigurationName)"
    />
    <UserMacro
        Name="%NAME%_OBJ"
        Value="$(%NAME%_BUILD)/obj/$(ProjectName)"
    />
    <UserMacro
        Name="%NAME%_LIB"
        Value="$(%NAME%_BUILD)/lib"
    />
    <UserMacro
        Name="%NAME%_BIN"
        Value="$(%NAME%_BUILD)/bin"
    />

    <!--
    =====================================================================
    =====================================================================
    -->

    <UserMacro
        Name="%NAME%_DEFINES"
        Value=""
    />
    <UserMacro
        Name="%NAME%_DEBUG_DEFINES"
        Value="$(%NAME%_DEFINES);$(%DEPENDS%_DEBUG_DEFINES)"
    />
    <UserMacro
        Name="%NAME%_RELEASE_DEFINES"
        Value="$(%NAME%_DEFINES);$(%DEPENDS%_RELEASE_DEFINES)"
    />

    <!--
    =====================================================================
    =====================================================================
    -->
  
    <UserMacro
        Name="%NAME%_INCLUDE_DIRS"
        Value="$(%NAME%_SOURCE_DIR);$(%DEPENDS%_INCLUDE_DIRS)"
    />
    <UserMacro
        Name="%NAME%_LIB_DIRS"
        Value="$(%NAME%_LIB);$(%DEPENDS%_LIB_DIRS)"
    />
    <UserMacro
        Name="%NAME%_LIBS"
        Value="lib%Name%.lib $(%DEPENDS%_LIBS)"
    />

    <!--
    =====================================================================
    =====================================================================
    -->

</VisualStudioPropertySheet>
%
%)%)%%
