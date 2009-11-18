<div class="report">
<h1>List sites</h1>
	<table>
		<!--TR-->
		<tr class="header_table">
			<td width="14"></td>
			<td width="300">Name site</td>
			<td width="100">Campaigns</td>
			<td></td>
		</tr>
		<!--dimanic-->
		<S foreach from=$sites item=site S>
			<tr class="item_table">
				<td width="14">
					<a href="<S $helper->url('tracks/campaigns/') S><S $site->name S>">
						<S $helper->img('sitemap_color.png') S>
					</a>
				</td>
				<td>
					<a href="<S $helper->url('tracks/campaigns/') S><S $site->name S>">
						<S $site->name S>
					</a>
				</td>
				<td align="center"><S $site->count_campaigns() S></td>
				<td></td>
			</tr>
		<S/foreach S>
		<!---->
	</table>
</div>