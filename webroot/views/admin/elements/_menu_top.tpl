<div class="grid_7">
	<div class="menu_header">
	<ul>
		<li><a href="/admin/dashboard"<S if $globals.action=='dashboard' S>
				class="current"
			<S /if S>>Dashboard</a></li>
		<!--li><a href="/admin/menus/menus_list"<S if $globals.controller=='adminmenus' S>
				class="current"
			<S /if S>>Containers/Menus</a></li-->
		<li><a href="/admin/pages"<S if $globals.controller=='adminpages' && $globals.action!='dashboard'  S>
				class="current"
			<S /if S>>Pages</a></li>
		<li><a href="/admin/twitter/"<S if $globals.controller=='admintwitter' S>
				class="current"
			<S /if S>>My Twitter</a></li>
	</ul>
	</div>
</div>
<div class="grid_9" style="text-align:right">
	<div class="menu_header">
	<ul>
		<!--li><a href="/admin/customers/"<S if $globals.controller=='admincustomers' S>
				class="current"
			<S /if S>>Customers</a></li>
		<li><a href="/admin/orders/"<S if $globals.controller=='adminorders' S>
						class="current"
			<S /if S>>Orders</a></li-->
		<li><a href="/admin/manufactures/"<S if $globals.controller=='adminmanufactures' S>
				class="current"
			<S /if S>>Manufactures</a></li>
		<li><a href="/admin/users/"<S if $globals.controller=='adminusers' S>
				class="current"
			<S /if S>>Users</a></li>
		<li><a href="#/admin/stats/">PIWIK Stats</a></li>
	</ul>
	</div>
</div>
<div class="clear"></div>