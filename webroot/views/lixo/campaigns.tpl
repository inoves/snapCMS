<div class="report">
<h1>List campaigns: <S $site S></h1>
	<table>
		<!--TR-->
		<tr class="header_table">
			<td width="14"></td>
			<td width="300">Name campaign</td>
			<td width="100">Date</td>
			<td width="100">Hits</td>
			<td>Site</td>
		</tr>
		<!--dimanic-->
		<S foreach from=$campaigns item=camp S>
			<tr class="item_table">
				<td width="14">
					<a href="<S $helper->url('tracks/chart/') S><S $camp->id S>">
						<S $helper->img('chart_line.png') S>
					</a>
				</td>
				<td>
					<a href="<S $helper->url('tracks/chart/') S><S $camp->id S>">
						<S $camp->name S>
					</a></td>
				<td><S $camp->created() S></td>
				<td align="center"><S $camp->count_hits() S></td>
				<td><S $camp->site_name() S></td>
			</tr>
		<S/foreach S>
		<!---->
	</table>
</div>