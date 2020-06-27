@-moz-document url-prefix(https://discovery.addons.mozilla.org),
url-prefix(chrome://),
url-prefix(about:),
url-prefix(file:),
url(https://www.mozilla.org/credits/),
url-prefix(https://addons.mozilla.org),
url-prefix(http://addons.mozilla.org),
url-prefix(https://raw.githubusercontent.com),
url-prefix(moz-extension),
url-prefix(view-source),
regexp(".*\\.(p|P)(d|D)(f|F).*") {
  :root {
    --magenta-50: #ff1ad9;
    --magenta-60: #ed00b5;
    --magenta-70: #b5007f;
    --magenta-80: #7d004f;
    --magenta-90: #440027;
    --purple-50: #9400ff;
    --purple-60: #8000d7;
    --purple-70: #6200a4;
    --purple-80: #440071;
    --purple-90: #25003e;
    --blue-40: #45a1ff;
    --blue-50: #0a84ff;
    --blue-60: #0060df;
    --blue-70: #003eaa;
    --blue-80: #002275;
    --blue-90: #000f40;
    --teal-50: #00feff;
    --teal-60: #00c8d7;
    --teal-70: #008ea4;
    --teal-80: #005a71;
    --teal-90: #002d3e;
    --green-50: #30e60b;
    --green-60: #12bc00;
    --green-70: #058b00;
    --green-80: #006504;
    --green-90: #003706;
    --yellow-50: #ffe900;
    --yellow-60: #d7b600;
    --yellow-70: #a47f00;
    --yellow-80: #715100;
    --yellow-90: #3e2800;
    --red-50: #ff0039;
    --red-60: #d70022;
    --red-70: #a4000f;
    --red-80: #5a0002;
    --red-90: #3e0200;
    --orange-50: #ff9400;
    --orange-60: #d76e00;
    --orange-70: #a44900;
    --orange-80: #712b00;
    --orange-90: #3e1300;
    --grey-10: #f9f9fa;
    --grey-20: #ededf0;
    --grey-30: #d7d7db;
    --grey-40: #b1b1b3;
    --grey-50: #737373;
    --grey-60: #4a4a4f;
    --grey-70: #000000;
    --grey-80: #2a2a2e;
    --grey-90: #000000;
    --code-green: #86de74!important;
    --warning-color: #FCE19F;
    --warning-background-color: #191D2A;
    --theme-highlight-green: #86DE74;
    --theme-highlight-blue: #75BFFF;
    --theme-highlight-purple: #B98EFF;
    --theme-highlight-red: #FF7DE9;
    --theme-highlight-yellow: #FFF89E;
    --theme-highlight-bluegrey: #5e88b0;
    --theme-highlight-lightorange: #d99b28;
    --theme-highlight-orange: #d96629;
    --theme-highlight-pink: #df80ff;
    --tone-1: var(--grey-10);
    --tone-2: var(--grey-20);
    --tone-3: var(--grey-30);
    --tone-4: var(--grey-40);
    --tone-5: var(--grey-50);
    --tone-6: var(--grey-60);
    --tone-7: var(--grey-70);
    --tone-8: var(--grey-80);
    --tone-9: var(--grey-90);
    --accent-1: var(--blue-40);
    --accent-2: var(--blue-50);
    --accent-3: var(--blue-60);
    --in-content-page-color: var(--tone-4)!important;
    --in-content-page-background: var(--tone-7)!important;
    --in-content-text-color: var(--tone-3)!important;
    --in-content-selected-text: var(--tone-1)!important;
    --in-content-selected-text-background: #5675b9;
    --in-content-box-background: var(--tone-6)!important;
    --in-content-box-background-odd: #f3f6fa;
    --in-content-box-background-hover: var(--tone-6)!important;
    --in-content-box-background-active: var(--tone-6)!important;
    --in-content-box-border-color: var(--tone-5)!important;
    --in-content-item-hover: rgba(0,149,221,0.25);
    --in-content-item-selected: var(--tone-8)!important;
    --in-content-border-highlight: var(--accent-1)!important;
    --in-content-border-focus: var(--accent-1)!important;
    --in-content-border-color: var(--tone-6)!important;
    --in-content-category-outline-focus: 1px dotted #0a84ff;
    --in-content-category-text: var(--tone-4)!important;
    --in-content-category-text-active: #000000;
    --in-content-category-text-selected: var(--accent-1)!important;
    --in-content-category-text-selected-active: #0060df;
    --in-content-category-background-hover: rgba(12,12,13,0.1);
    --in-content-category-background-active: rgba(12,12,13,0.15);
    --in-content-category-background-selected-hover: rgba(12,12,13,0.15);
    --in-content-category-background-selected-active: rgba(12,12,13,0.2);
    --in-content-tab-color: #424f5a;
    --in-content-link-color: var(--accent-1)!important;
    --in-content-link-color-hover: var(--accent-2)!important;
    --in-content-link-color-active: #003eaa;
    --in-content-link-color-visited: #0a8dff;
    --in-content-primary-button-background: var(--accent-2)!important;
    --in-content-primary-button-background-hover: var(--accent-3)!important;
    --in-content-primary-button-background-active: var(--accent-3)!important;
    --in-content-table-border-dark-color: var(--tone-7)!important;
    --in-content-table-header-background: var(--accent-2)!important;
    --theme-selection-background: var(--accent-2)!important;
    --theme-selection-background-hover: var(--accent-1)!important;
    --in-content-category-header-background: var(--tone-8)!important;
    --selected-icon-fill-color: var(--tone-2)!important;
    --in-content-dark-header-background: var(--tone-9)!important;
    --tab-line-selected-color: var(--accent-2)!important;
    --secure-connection-color: var(--accent-1);
    --tab-background-color: var(--tone-9)!important;
    --tab-color: var(--in-content-selected-text);
    --theme-sidebar-background: #1B1B1D!important;
    --card-outline-color: var(--in-content-box-border-color)!important;
    --cm-background: var(--tone-8)!important;
    --cm-selection: #353b48!important;
    --cm-marker: #555!important;
    --cm-linenumber: #58575c!important;
    --cm-cursor: #fff!important;
    --cm-active-line-background: rgba(185,215,253,.15)!important;
    --cm-matching-bracket: rgba(255,255,255,.25)!important;
    --cm-search-background: rgba(24,29,32,1)!important;
    --cm-red: #de7474!important;
    --start-indicator-for-updater-scripts: black;
    --end-indicator-for-updater-scripts: black;
    --dummy-variable-for-updater-scripts: black
  }
}

@-moz-document regexp("^about:(?!reader).*"),
url(https://www.mozilla.org/credits/),
url-prefix(https://discovery.addons.mozilla.org) {
  :root {
    --aboutProfiles-table-background: var(--in-content-box-background)!important
  }
  menupopup,
  menupopup > menu > menupopup,
  popup,
  popup > menu > menupopup {
    -moz-appearance: none!important;
    background: var(--in-content-box-background)!important;
    border: none!important;
    padding: 0!important
  }
  menuitem,
  menupopup menu {
    -moz-appearance: none!important;
    color: var(--in-content-selected-text)!important
  }
  menuitem:hover,
  menupopup menu:hover {
    color: var(--in-content-text-color)!important;
    background-color: var(--in-content-primary-button-background-hover)!important
  }
  menupopup menuseparator {
    padding: 0!important;
    margin: 2px 6px!important;
    -moz-appearance: none!important;
    background: rgba(0,0,0,0)!important;
    border: 0!important
  }
  @media screen and (-moz-windows-theme) {
    menuitem,
    menupopup menu {
      margin: 1px 6px!important
    }
    menupopup,
    menupopup > menu > menupopup,
    popup,
    popup > menu > menupopup {
      border: 1px solid!important;
      border-color: var(--in-content-box-background)!important
    }
  }
  .prefs-pane [type=checkbox]:checked + label::after,
  .prefs-pane [type=checkbox]:not(:checked) + label::after,
  input[type=checkbox]:checked {
    background-image: url(chrome://global/skin/in-content/check.svg),url(chrome://global/skin/icons/check.svg)!important
  }
  .contentSearchSuggestionsList {
    background-color: var(--in-content-box-background)!important;
    border: none!important
  }
  .contentSearchHeader,
  .contentSearchOneOffsTable {
    background-color: var(--in-content-category-header-background)!important;
    border: none!important;
    color: var(--in-content-text-color)!important
  }
  #newtab-customize-overlay,
  .exceptionDialogButtonContainer,
  .snippet .button-link,
  html[dir=ltr][lang],
  html[dir=ltr][lang] body,
  html[dir=rtl][lang],
  html[dir=rtl][lang] body {
    background: var(--in-content-page-background)!important;
    color: var(--in-content-page-color)!important
  }
  #SanitizeDialogPane > groupbox,
  #mainDiv.non-verbose div.section h2,
  #onboarding-overlay,
  .dialogBox,
  .dialogBox > .groupbox-body,
  .modal,
  .modal-overlay,
  .warningBackground {
    background: var(--in-content-page-background)!important
  }
  #homeContentsGroup checkbox[src] .checkbox-icon,
  .arrowhead,
  .checkbox-icon,
  .content-blocking-cookies-image,
  .content-blocking-trackers-image,
  .content-container .icon-container .icon[src=""],
  .extension-controlled-icon,
  .snippet .block-snippet-button,
  .textbox-search-sign {
    filter: invert(65%)!important
  }
  .searchBarHiddenImage,
  .searchBarShownImage {
    filter: invert(80%)!important
  }
  #trackingGroup .indent > description,
  #trackingGroup description.indent,
  .collapsible-section .section-top-bar .info-option-manage button,
  .topic .topic-read-more,
  a:link {
    color: var(--in-content-link-color)!important
  }
  .topic .topic-read-more:hover,
  a:link:hover {
    color: var(--in-content-link-color-hover)!important
  }
  menulist[disabled=true] {
    color: var(--in-content-box-border-color)!important
  }
  #action-box,
  #badCertAdvancedPanel,
  #content div.log span.section-heading button.no-print:hover,
  #content div.stats span.section-heading button.no-print:hover,
  #contents table tbody tr td,
  #contents table tr.no-copy td,
  #controls.no-print div.controls div.control button:hover,
  #errorPageContainer button#errorTryAgain:hover,
  #header-utils-btn[open=true],
  #profiles table,
  #provider table#provider-table tbody#provider-table-body tr td,
  #subprocess-reports tr td,
  .aboutPageWideContainer div#debug table#debug-table tbody tr td,
  .aboutPageWideContainer label input#submit:hover,
  .alert,
  .opsRow button:hover,
  .top-sites-list .top-site-outer .top-site-icon {
    background-color: var(--in-content-box-background)!important
  }
  #snippetContainer #snippets,
  .addon .editorial-description,
  .addon .heading,
  .disco-content,
  .top-sites-list .top-site-outer .title span,
  header h1,
  xul|groupbox xul|label:not(.menu-accel):not(.menu-text):not(.indent):not(.learnMore):not(.tail-with-learn-more) {
    color: var(--in-content-page-color)!important
  }
  #onboarding-overlay.onboarding-opened > #onboarding-overlay-dialog,
  #searchWrapper input#searchText,
  .addon .content,
  .addon .logo,
  .card-outer,
  .card-outer .card-context,
  .card-outer .card-details,
  .search-wrapper input,
  .topsite-form .form-wrapper input[type=text],
  card-outer.active span.context-menu ul.context-menu-list {
    background: var(--in-content-box-background)!important
  }
  #snippets-container,
  .sorter[checkState="1"],
  .sorter[checkState="2"] {
    background-color: var(--in-content-category-header-background)!important
  }
  .contentSearchSettingsButton {
    display: none!important
  }
  #onboarding-overlay.onboarding-opened > #onboarding-overlay-dialog,
  #scene1 h1,
  .addon,
  .card-outer .card-context,
  .card-outer .card-host-name,
  .detail-view-container,
  .section-title span,
  .snippet section,
  .tail-with-learn-more,
  .top-sites-list .top-site-outer .top-site-icon,
  .topsite-form .form-wrapper input[type=text] {
    color: var(--in-content-page-color)!important
  }
  #searchWrapper #searchIcon,
  #searchWrapper #searchSubmit,
  .card-outer .card-context-icon,
  .category:not([selected]) > .category-icon,
  .collapsible-section .section-top-bar .info-option-icon,
  .context-menu ul.context-menu-list li.context-menu-item a span.icon,
  .prefs-pane-button button,
  .search-wrapper .search-button,
  .search-wrapper .search-label,
  .section-title span {
    fill: var(--in-content-page-color)!important
  }
  .sorter {
    color: var(--accent-1)!important
  }
  .download-progress {
    background-color: var(--in-content-box-color)!important
  }
  .list > scrollbox > .scrollbox-innerbox {
    border: none!important
  }
  #header-utils-btn:hover,
  .header-button:hover {
    background-color: var(--in-content-box-background-hover)!important
  }
  #header-utils-btn {
    fill: var(--in-content-category-text)!important
  }
  .collapsible-section .section-top-bar .info-option-manage button:after,
  .topic .topic-read-more::after {
    fill: var(--in-content-link-color)!important
  }
  .addon-view[notification=warning] {
    --view-highlight-color: transparent!important
  }
  .addon-view[notification],
  .addon-view[pending] {
    --view-highlight-color: transparent;
    background-image: none!important
  }
  .addon[active=false] {
    opacity: .4!important
  }
  #addon-list .addon[active=false] > .content-container > .content-inner-container {
    color: var(--in-content-text-color)!important
  }
  .detail-row,
  .detail-row-complex,
  setting {
    text-shadow: none!important
  }
  #warningTitle {
    color: var(--in-content-page-color)!important
  }
  #configTree {
    border: none!important
  }
  .addon-target-container {
    background: var(--in-content-box-background)!important;
    box-shadow: none!important
  }
  .service-worker-multi-process {
    background-color: #44391f!important
  }
  #onboarding-notification-bar {
    background: var(--in-content-category-header-background)!important;
    border-top: 2px solid!important
  }
  .prefs-pane .actions,
  .prefs-pane .sidebar {
    background: var(--in-content-category-header-background)!important;
    border-color: var(--in-content-box-border-color)!important
  }
  .collapsible-section .section-top-bar .info-option,
  .content-blocking-category,
  .extension-controlled,
  .prefs-pane .prefs-modal-inner-wrapper .options,
  .sections-list .section-empty-state {
    background: var(--in-content-box-background)!important;
    border-color: var(--in-content-box-border-color)!important
  }
  .actions button:hover:not(.dismiss),
  .card-outer:-moz-any(:hover,:focus,.active):not(.placeholder),
  .collapsible-section .section-disclaimer button:hover:not(.dismiss),
  .top-sites-list .top-site-outer.active .tile,
  .top-sites-list .top-site-outer:focus .tile,
  .top-sites-list .top-site-outer:hover .tile {
    box-shadow: 0 0 0 5px var(--in-content-box-background)!important
  }
  .card-outer .context-menu-button,
  .top-sites-list .top-site-outer .context-menu-button {
    background-color: var(--in-content-box-background)!important;
    border-color: var(--in-content-box-border-color)!important
  }
  #onboarding-notification-body *,
  #onboarding-notification-tour-title,
  .collapsible-section .section-disclaimer,
  .manual-migration-container,
  .onboarding-close-btn,
  .prefs-pane .prefs-modal-inner-wrapper {
    color: var(--in-content-page-color)!important
  }
  .collapsible-section .section-disclaimer button,
  .onboarding-action-button {
    background-color: var(--in-content-page-background)!important;
    border-color: var(--in-content-box-border-color)!important;
    color: var(--in-content-page-color)!important
  }
  .actions button,
  .actions button.dismiss,
  .onboarding-action-button:hover,
  .prefs-pane-button button:hover {
    background-color: var(--in-content-box-background-hover)!important
  }
  .actions button.done,
  .onboarding-tour-action-button {
    background-color: var(--in-content-primary-button-background)!important
  }
  .onboarding-tour-action-button:hover {
    background-color: var(--in-content-primary-button-background-hover)!important
  }
  .icon.icon-dismiss {
    fill: var(--in-content-page-color)!important
  }
  .context-menu ul.context-menu-list li.context-menu-item a:hover span.icon {
    fill: var(--in-content-text-color)!important
  }
  .dialogBox > .groupbox-title,
  .dialogTitleBar {
    background-color: var(--in-content-category-header-background)!important;
    color: var(--in-content-page-color)!important;
    border-color: var(--in-content-box-border-color)!important
  }
  .warningMessage {
    background: var(--in-content-box-background)!important;
    border-color: var(--in-content-box-border-color)!important;
    color: var(--in-content-page-color)!important
  }
  #badCertAdvancedPanel.advanced-panel,
  #content > div,
  .info-box-content,
  .notice,
  div.opsRow,
  div.section {
    background-color: var(--in-content-box-background)!important;
    border-color: var(--in-content-box-border-color)!important
  }
  .bar-inner {
    background-color: var(--accent-1)!important;
    border: 1px solid!important;
    border-color: var(--accent-2)!important
  }
  #content div.log span.section-heading button.no-print,
  #content div.stats span.section-heading button.no-print,
  #controls.no-print div.controls div.control button,
  #controls.no-print div.controls div.control button input#appid,
  #errorPageContainer button#errorTryAgain,
  .aboutPageWideContainer label input#submit,
  .opsRow button {
    -moz-appearance: none!important;
    background-color: var(--in-content-page-background)!important;
    border: 1px solid!important;
    border-radius: 3px!important;
    color: var(--in-content-page-color)!important;
    border-color: var(--in-content-box-border-color)!important
  }
  .opsRow button {
    margin-right: 2px!important
  }
  input#appid {
    background-color: var(--in-content-box-background)!important
  }
  #profiles.tab div table tbody tr td {
    border-color: var(--in-content-table-border-dark-color)!important
  }
  .actions,
  .context-menu-list li.separator,
  .edit-topsites-wrapper .edit-topsites-button,
  .modal,
  .prefs-pane hr,
  .topsite-form .form-wrapper input[type=text] {
    border-color: var(--in-content-box-border-color)!important
  }
  #outside table.contenttable thead tr th {
    background-color: var(--in-content-table-header-background)!important
  }
  #outside table.contenttable {
    border-color: var(--in-content-table-border-dark-color)!important;
    background-color: var(--in-content-box-background)!important
  }
  #outside table.contenttable tbody tr td,
  #outside table.contenttable tbody tr td + #outside table.contenttable tbody tr td,
  #outside table.contenttable thead tr th + th {
    border-color: var(--in-content-table-border-dark-color)!important
  }
  #outside table.contenttable tbody tr td {
    color: var(--in-content-page-color)!important
  }
  .card-outer .card-context {
    padding: 2px 16px 12px 14px!important
  }
  .card-outer.placeholder .card {
    display: none!important
  }
  .context-menu {
    background-color: var(--in-content-box-background)!important;
    box-shadow: none!important;
    border: 1px!important
  }
  .context-menu > ul > li > a:focus,
  .context-menu > ul > li > a:hover {
    background-color: var(--theme-selection-background-hover)!important
  }
  #searchText:active,
  #searchText:focus,
  .search-wrapper input:focus,
  .search-wrapper:active input {
    box-shadow: 0 0 0 3px var(--in-content-border-focus)!important
  }
  .prefs-pane .actions {
    border-top: none!important
  }
}
@-moz-document url-prefix(about:reader) {
  body.dark a:link {
    color: var(--in-content-link-color)!important
  }
  .font-type-buttons > .sans-serif-button > .name,
  .font-type-buttons > .serif-button > .name,
  body.dark {
    color: var(--in-content-page-color)!important
  }
  .toolbar {
    background-color: var(--in-content-category-header-background)!important;
    border-right: 1px solid!important;
    border-color: var(--in-content-box-border-color)!important
  }
  .toolbar .button {
    background-color: var(--in-content-category-header-background)!important;
    border-color: var(--in-content-box-border-color)!important
  }
  .button:hover,
  .content-width-buttons > button:hover,
  .font-size-buttons > button:hover,
  .font-type-buttons > button:hover,
  .line-height-buttons > button:hover {
    background-color: var(--in-content-primary-button-background-hover)!important
  }
  .dropdown-popup {
    background-color: var(--in-content-category-header-background)!important;
    box-shadow: 0 1px 3px var(--in-content-category-header-background)!important;
    border-color: var(--in-content-box-border-color)!important
  }
  .content-width-buttons > button,
  .font-size-buttons > button,
  .font-type-buttons > button,
  .font-type-buttons > button.selected,
  .font-type-buttons > button:active:hover,
  .line-height-buttons > button {
    border-color: var(--in-content-box-border-color)!important
  }
  .color-scheme-buttons > button.selected,
  .color-scheme-buttons > button:active:hover,
  .font-type-buttons > button.selected,
  .font-type-buttons > button:active:hover {
    box-shadow: inset 0 -3px 0 0 var(--in-content-primary-button-background-hover)!important
  }
}
@-moz-document url-prefix(about:addons) {
  .DiscoPane-header-intro {
    color: var(--in-content-text-color)!important
  }
}
@-moz-document url-prefix(about:blank) {
  html > body:empty:not(.vimvixen-console) {
    background-color: var(--in-content-page-background)!important;
    margin: 0!important
  }
}
@-moz-document url-prefix(about:memory) {
  html {
    background: var(--in-content-page-background)!important
  }
  .legend,
  .opsRowLabel,
  .section,
  .treeline {
    color: var(--in-content-page-color)!important
  }
}
@-moz-document url-prefix(about:webrtc) {
  html {
    background-color: var(--in-content-page-background)!important;
    color: var(--in-content-page-color)!important
  }
  #content > div,
  .peer-connection > h3 {
    background-color: var(--in-content-page-background)!important
  }
  .fold-trigger {
    color: var(--in-content-link-color)!important
  }
  table {
    color: var(--in-content-text-color)!important;
    background-color: var(--in-content-page-background)!important
  }
  .peer-connection table tr {
    background-color: var(--in-content-box-background)!important
  }
  .trickled {
    background-color: var(--in-content-border-focus)!important;
    color: var(--in-content-selected-text)!important
  }
  .peer-connection table tr:first-of-type {
    background-color: var(--in-content-table-header-background)!important;
    color: var(--in-content-selected-text)!important
  }
}
@-moz-document url-prefix(chrome://) {
  #ColorsDialogPane,
  #ConnectionsDialogPane,
  #FontsDialogPane,
  #LanguagesDialogPane,
  .windowDialog,
  dialog,
  prefpane,
  prefpane > .content-box,
  prefwindow,
  window {
    background-color: var(--in-content-page-background)!important;
    color: var(--in-content-page-color)!important
  }
  #cookieInfoGrid .textbox-input {
    background-color: var(--in-content-page-background)!important
  }
  #historyItems {
    -moz-appearance: none!important
  }
}
/*! Colors hard coded due to variables not being recognized from
 color_variables.css ... Firefox bug? */
@-moz-document url-prefix(https://discovery.addons.mozilla.org) {
  .addon .ThemeImage,
  header {
    border-color: #4a4a4f!important
  }
  .addon .editorial-description,
  .addon .heading span,
  .disco-content {
    color: #b1b1b3!important
  }
  .Button--action,
  .Button--action:link,
  .Button--action:not(.Button--disabled):hover,
  .addon .heading,
  header h1 {
    color: #f9f9fa!important
  }
}

@-moz-document url-prefix(https://raw.githubusercontent.com) {
  html {
    background: var(--in-content-page-background)!important;
    color: var(--in-content-page-color)!important
  }
}

html#feedHandler,
html#feedHandler body {
  background-color: var(--in-content-page-background)!important;
  color: var(--in-content-page-color)!important
}
html#feedHandler h1 {
  border-color: var(--in-content-box-border-color)!important;
  color: var(--in-content-selected-text)!important
}
html#feedHandler #feedBody,
html#feedHandler #feedHeader {
  background-color: var(--in-content-box-background)!important;
  border-color: var(--in-content-box-border-color)!important;
  color: var(--in-content-page-color)!important
}
html#feedHandler *|:link {
  color: var(--in-content-link-color)!important
}
html#feedHandler #subscribeButton {
  -moz-appearance: none!important;
  background: var(--in-content-page-background)!important;
  color: var(--in-content-page-color)!important;
  border: 1px solid;
  border-color: var(--in-content-box-border-color)!important;
  border-radius: 4px
}
html#feedHandler #subscribeButton:hover {
  background: var(--in-content-box-background)!important
}
html#feedHandler .enclosures {
  background: var(--in-content-page-background)!important;
  border-color: var(--in-content-box-border-color)!important
}
#feedHeaderContainer {
  background-color: var(--in-content-box-background)!important;
  display: inline-block!important
}
#feedHeaderContainerSpacer {
  display: none!important
}
#feedBody div.entry a[href] {
  color: var(--in-content-link-color)!important
}
#feedBody div.entry a[href]:hover {
  color: var(--in-content-link-color-hover)!important
}
#feedBody div.entry a[href]:active {
  color: var(--in-content-link-color-active)!important
}
#feedBody div.entry a[href]:visited {
  color: var(--in-content-link-color-visited)!important
}

@-moz-document url-prefix(view-source) {
  :root {
    background-color: var(--in-content-page-background)!important;
    color: var(--in-content-page-color)!important
  }
  pre[id]:before,
  span[id]:before {
    color: var(--in-content-page-color)!important
  }
  .highlight .end-tag,
  .highlight .start-tag {
    color: var(--theme-highlight-purple)!important
  }
  .highlight .comment {
    color: var(--theme-highlight-green)!important
  }
  .highlight .cdata {
    color: #c06!important
  }
  .highlight .doctype {
    color: #4682b4!important
  }
  .highlight .pi {
    color: var(--theme-highlight-red)!important
  }
  .highlight .entity {
    color: #dea174!important
  }
  .highlight .attribute-name {
    color: var(--theme-highlight-green)!important
  }
  .highlight .attribute-value {
    color: var(--theme-highlight-blue)!important
  }
  .highlight .markupdeclaration {
    color: #4682b4!important
  }
  .highlight .error,
  .highlight .error > :-moz-any(.start-tag,.end-tag,.comment,.cdata,.doctype,.pi,.entity,.attribute-name,.attribute-value) {
    color: #de7474!important
  }
}

@-moz-document url-prefix("https://addons.mozilla.org") {
  .Footer,
  .Footer-wrapper,
  .LanguageTools-header-row,
  .amo {
    background: var(--in-content-category-header-background)!important
  }
  h1,
  h2 {
    color: var(--in-content-category-text)!important
  }
  .Guides-header,
  .HomeHeroGuides-sections .Hero-name-HomeHeroGuides {
    border-color: var(--in-content-box-border-color)!important
  }
  .App-content,
  .Home,
  .LandingPage,
  .LanguageTools-table-row:nth-child(2n),
  .Paginate {
    background: var(--in-content-page-background)!important
  }
  .Select {
    background-color: var(--in-content-page-background)!important
  }
  .SearchForm-icon-magnifying-glass {
    filter: invert(65%)!important
  }
  .AddonDescription-more-addons--theme .Card-contents .AddonsCard-list,
  .AddonDescription-more-addons:not(.AddonDescription-more-addons--theme) .Card-contents .AddonsCard-list,
  .AddonsByAuthorsCard .Card-contents .AddonsCard-list,
  .AddonsCard--horizontal .Card-contents,
  .AddonsCard--horizontal ul.AddonsCard-list .SearchResult-link,
  .AutoSearchInput-suggestions-item,
  .Card--photon .Card-contents,
  .Card-contents,
  .Card-contents li,
  .Card-footer,
  .Card-footer-link,
  .Card-footer-text,
  .Card-header,
  .Categories .Card-contents,
  .DropdownMenu-items::after,
  .Hero .Card-contents,
  .Home-SubjectShelf .Card-contents,
  .LandingPage-header,
  .MetadataCard,
  .Search .SearchResults .SearchResult,
  .Search .SearchResults-message,
  .SearchForm-query,
  .SearchForm-suggestions-item.SearchForm-suggestions-item,
  .SectionLinks-dropdown .DropdownMenu-items,
  input.AutoSearchInput-query {
    background: var(--in-content-box-background)!important
  }
  .Addon-author,
  .Addon-author a,
  .Addon-author a:link .Button--action,
  .Addon-title,
  .AddonBadges .Badge,
  .AddonTitle,
  .Button--action,
  .Button--action.Button--small:link,
  .Button--action:link,
  .Button--neutral,
  .Button--neutral:link,
  .Card--photon .Card-contents,
  .Card-contents,
  .Card-footer-text,
  .Definition-dt,
  .DropdownMenuItem,
  .DropdownMenuItem-link a,
  .DropdownMenuItem-link a:link,
  .DropdownMenuItem-section,
  .ExpandableCard-ToggleLink:link,
  .Footer a:active,
  .Footer a:hover,
  .Footer-links-header a:link,
  .GuidesAddonCard .AddonTitle a,
  .GuidesAddonCard .GuidesAddonCard-content-header-title .AddonTitle-author,
  .Home-SubjectShelf-link:link,
  .Home-SubjectShelf-link:visited,
  .Home-SubjectShelf-subheading,
  .LandingPage-addonType-name,
  .LandingPage-heading-content,
  .MetadataCard-list dt,
  .Paginate .Button.Paginate-item--current-page,
  .Paginate .Button.Paginate-item:first-child,
  .Paginate .Button.Paginate-item:last-child,
  .Paginate .Button.Paginate-item:link:first-child,
  .Paginate .Button.Paginate-item:link:last-child,
  .Paginate .Button.Paginate-item:visited:first-child,
  .Paginate .Button.Paginate-item:visited:last-child .Paginate-page-number,
  .PermissionsCard-subhead,
  .ReportAbuseButton-show-more,
  .SearchContextCard-header,
  .SearchFilters-label,
  .SearchForm-query,
  .SearchResult--meta-section,
  .SearchResult-name,
  .SearchResult-summary,
  .Select,
  input.AutoSearchInput-query {
    color: var(--in-content-page-color)!important
  }
  .Paginate .Button.Paginate-item:active,
  .Paginate .Button.Paginate-item:hover {
    background-color: var(--in-content-box-background)!important
  }
  .AutoSearchInput-suggestions-item {
    color: var(--in-content-page-color)
  }
  .Card-header {
    color: var(--in-content-text-color)!important
  }
  .Card-contents li .Rating-star-group,
  .Paginate-next::after,
  .Paginate-previous::before {
    filter: invert(70%)!important
  }
  .AddonMeta .MetadataCard-content a,
  .AddonMeta .MetadataCard-content a.AddonMeta-reviews-content-link,
  .AddonMeta .MetadataCard-content a.AddonMeta-reviews-content-link:link,
  .AddonMeta .MetadataCard-content a.AddonMeta-reviews-content-link:visited,
  .AddonMeta .MetadataCard-content a:link,
  .AddonMeta .MetadataCard-content a:visited,
  .AddonMeta .MetadataCard-title a,
  .AddonMeta .MetadataCard-title a.AddonMeta-reviews-content-link,
  .AddonMeta .MetadataCard-title a.AddonMeta-reviews-content-link:link,
  .AddonMeta .MetadataCard-title a.AddonMeta-reviews-content-link:visited,
  .AddonMeta .MetadataCard-title a:link,
  .AddonMeta .MetadataCard-title a:visited,
  .RatingsByStar-count a:active,
  .RatingsByStar-count a:link,
  .RatingsByStar-count a:visited,
  .RatingsByStar-star a:active,
  .RatingsByStar-star a:link,
  .RatingsByStar-star a:visited {
    color: var(--in-content-page-color)!important
  }
  .Rating-star {
    /*! background-image: url("data:image/svg+xml,%3Csvg width='17px' height='16px' viewBox='0 0 17 16' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'%3E %3C!-- Generator: Sketch 47.1 (45422) - http://www.bohemiancoding.com/sketch --%3E %3Cdesc%3ECreated with Sketch.%3C/desc%3E %3Cdefs%3E%3C/defs%3E %3Cg id='Screens' stroke='none' stroke-width='1' fill='none' fill-rule='evenodd'%3E %3Cg id='Extension-Detail---1366px' transform='translate(-1200.000000, -191.000000)' fill-rule='nonzero' fill='%23737373'%3E %3Cpath d='M1216.67559,197.013479 C1216.54115,196.628667 1216.19883,196.344304 1215.78203,196.271203 L1211.45804,195.530952 L1209.42135,191.617039 C1209.22458,191.238958 1208.8214,191 1208.38027,191 C1207.93914,191 1207.53597,191.238958 1207.33919,191.617039 L1205.30145,195.530952 L1200.98592,196.269177 C1200.56542,196.339521 1200.21894,196.624766 1200.08323,197.012329 C1199.94751,197.399891 1200.04437,197.827503 1200.33557,198.126387 L1203.43079,201.313214 L1202.78679,205.728392 C1202.72624,206.141968 1202.91235,206.553231 1203.26889,206.793722 C1203.62542,207.034213 1204.09248,207.063526 1204.47874,206.869654 L1208.37974,204.921305 L1212.28181,206.872692 C1212.66807,207.066564 1213.13512,207.037251 1213.49166,206.79676 C1213.84819,206.556269 1214.0343,206.145006 1213.97376,205.73143 L1213.3287,201.313214 L1216.42286,198.1274 C1216.71414,197.828621 1216.81115,197.401068 1216.67559,197.013479 Z' id='Star'%3E%3C/path%3E %3C/g%3E %3C/g%3E %3C/svg%3E")!important*/
  }
  .Rating-selected-star {
    background: url("data:image/svg+xml,%3Csvg width='17px' height='16px' viewBox='0 0 17 16' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'%3E %3C!-- Generator: Sketch 47.1 (45422) - http://www.bohemiancoding.com/sketch --%3E %3Cdesc%3ECreated with Sketch.%3C/desc%3E %3Cdefs%3E%3C/defs%3E %3Cg id='Screens' stroke='none' stroke-width='1' fill='none' fill-rule='evenodd'%3E %3Cg id='Extension-Detail---1366px' transform='translate(-1268.000000, -191.000000)' fill-rule='nonzero' fill='%23D7D7DB'%3E %3Cg id='Icon/Star/Off' transform='translate(1268.093458, 191.000000)'%3E %3Cpath d='M16.9387231,6.0134792 C16.8019739,5.62866693 16.4537759,5.34430427 16.0298163,5.27120279 L11.6315676,4.53095169 L9.55990532,0.617038533 C9.35975238,0.238957594 8.94965505,-8.43205013e-17 8.50094816,0 C8.05224128,5.62136675e-17 7.64214395,0.238957594 7.44199101,0.617038533 L5.36925312,4.53095169 L0.979609481,5.26917748 C0.55189384,5.33952054 0.199461709,5.62476632 0.0614173919,6.01232884 C-0.0766269256,6.39989135 0.0218952463,6.82750347 0.318097391,7.1263875 L3.46646469,10.3132141 L2.81140637,14.7283917 C2.74982246,15.1419679 2.93913032,15.5532305 3.30178728,15.7937216 C3.66444423,16.0342127 4.13951821,16.0635259 4.53241344,15.8696543 L8.50041035,13.9213053 L12.4694829,15.8726923 C12.8623781,16.0665639 13.3374521,16.0372507 13.7001091,15.7967596 C14.062766,15.5562685 14.2520739,15.1450059 14.19049,14.7314296 L13.534356,10.3132141 L16.6816477,7.12740015 C16.9779332,6.82862115 17.0766057,6.40106827 16.9387231,6.0134792 Z' id='Star-Copy'%3E%3C/path%3E %3C/g%3E %3C/g%3E %3C/g%3E %3C/svg%3E") 50%/contain no-repeat!important
  }
  .ShowMoreCard-contents::after {
    background: linear-gradient(rgba(255,255,255,0),var(--in-content-box-background))!important
  }
  .Addon-details .AddonDescription-contents a:link,
  .AddonMoreInfo-contents a:link,
  .Card-footer-link a,
  .Card-footer-link a:hover,
  .Card-footer-link a:link,
  .Card.ShowMoreCard.AddonDescription-version-notes a:link,
  .DropdownMenuItem-link a:hover,
  .Home-SubjectShelf-link:active,
  .Home-SubjectShelf-link:focus,
  .Home-SubjectShelf-link:hover,
  .LanguageTools-table a:link,
  .SearchResult-link:focus .SearchResult-name,
  .SearchResult-link:hover .SearchResult-name {
    color: var(--in-content-link-color)!important
  }
  .Button--action.Button--outline-only {
    border-color: var(--in-content-border-highlight)!important
  }
  input.AutoSearchInput-query {
    border-color: var(--in-content-box-border-color)!important
  }
  .Addon .InstallButton-button,
  .Button--action,
  .Button--action.Button--small,
  .SearchForm-suggestions-item.SearchForm-suggestions-item--highlighted {
    background: var(--in-content-primary-button-background)!important
  }
  .Button--action.Button--outline-only:hover,
  .Button--action:hover,
  .SearchForm-query:hover {
    border-color: var(--in-content-primary-button-background)!important
  }
  .SearchForm-query:focus {
    box-shadow: 0 0 5px 0 var(--in-content-border-highlight)!important;
    border-color: var(--in-content-primary-button-background)!important
  }
  .AddonsCard--horizontal ul.AddonsCard-list .SearchResult-link:hover {
    background: var(--in-content-page-background)!important;
    border-radius: 0!important
  }
  .Button--report {
    text-shadow: none!important
  }
  .Icon-arrow,
  .Icon-external {
    filter: invert(20%)!important
  }
  .Icon-magnifying-glass {
    filter: invert(65%)
  }
  .Icon-featured {
    filter: invert(85%)!important
  }
  .Icon-plus-dark {
    filter: invert(100%)!important
  }
  .Button--neutral.Button--puffy,
  .Button--neutral:link.Button--puffy {
    background: var(--in-content-primary-button-background)!important;
    color: var(--in-content-selected-text)!important
  }
  .Button--neutral.Button--puffy:hover,
  .Button--neutral:link.Button--puffy:hover {
    background: var(--in-content-primary-button-background-hover)!important
  }
}

@-moz-document regexp("^[file:///].*[^(html|svg)]$") {
  :root {
    background-color: var(--in-content-page-background)!important
  }
  body {
    border-color: var(--in-content-box-background)!important;
    background-color: var(--in-content-box-background)!important;
    color: var(--in-content-page-color)!important
  }
  h1 {
    border-color: var(--in-content-box-border-color)!important
  }
  body > table > tbody > tr:hover {
    outline-color: var(--in-content-box-background-hover)!important;
    background-color: var(--in-content-box-background-hover)!important
  }
  .dir,
  .file,
  .symlink,
  .up {
    color: var(--in-content-link-color)!important
  }
}

@-moz-document regexp("^moz-extension://.*manifest.json$") {
  html {
    background: var(--in-content-page-background)!important;
    color: var(--in-content-page-color)!important
  }
}

@-moz-document regexp(".*\\.(p|P)(d|D)(f|F).*") {
  #loadingBar .progress,
  .dropdownToolbarButton > select,
  .dropdownToolbarButton > select > option,
  .overlayButton,
  .secondaryToolbarButton,
  .toolbarField,
  body,
  div#viewer {
    background-color: var(--in-content-box-background)!important
  }
  body {
    background-image: none!important
  }
  .splitToolbarButtonSeparator,
  .verticalToolbarSeparator {
    box-shadow: none!important;
    background-color: var(--in-content-box-background)!important
  }
  div#toolbarViewer {
    background-color: var(--in-content-category-header-background)!important
  }
  #numPages,
  #pageNumber,
  #scaleSelect {
    color: var(--in-content-page-color)!important
  }
  .pdfViewer .page {
    border-image: none!important
  }
  #pageNumber,
  #scaleSelectContainer {
    border: 1px solid!important;
    border-color: var(--in-content-box-border-color)!important
  }
  #loadingBar {
    position: relative;
    width: 100%;
    height: 4px;
    background-color: var(--theme-selection-background-hover)!important;
    border-bottom: 1px solid!important
  }
  #sidebarContainer,
  #sidebarContent {
    background-color: var(--in-content-page-background)!important
  }
  #toolbarSidebar {
    background-color: var(--in-content-category-header-background)!important;
    background-image: none!important;
    border-color: var(--in-content-box-background)!important
  }
  .doorHanger,
  .doorHangerRight {
    border: 1px solid!important;
    border-color: var(--in-content-box-background)!important;
    box-shadow: none!important
  }
  #toolbarContainer,
  .findbar,
  .secondaryToolbar {
    background-color: var(--in-content-box-background)!important;
    background-image: none!important
  }
  .dropdownToolbarButton,
  .overlayButton,
  .secondaryToolbarButton,
  .toolbarButton {
    border: none!important;
    color: var(--in-content-page-color)!important
  }
  .dropdownToolbarButton,
  .overlayButton,
  .toolbarButton:focus,
  .toolbarButton:hover {
    background-color: var(--in-content-box-background)!important;
    background-image: none!important;
    border: none!important;
    box-shadow: none!important
  }
  .secondaryToolbarButton:focus,
  .secondaryToolbarButton:hover {
    background-color: var(--in-content-page-background)!important;
    background-image: none!important;
    box-shadow: none!important
  }
  .secondaryToolbarButton::before,
  .toolbarButton::before {
    filter: invert(20%)!important
  }
  .secondaryToolbarButton.toggled,
  .splitToolbarButton.toggled > .toolbarButton.toggled,
  .toolbarButton.toggled {
    background-color: var(--in-content-page-background)!important;
    background-image: none!important;
    box-shadow: none!important;
    color: var(--in-content-selected-text)!important
  }
  .horizontalToolbarSeparator {
    background-color: var(--in-content-box-border-color)!important;
    box-shadow: none!important
  }
}
