<div class="show_store">
	<table width="80%" style="margin:auto;" border="0" cellspacing="0" cellpadding="15">
		<tr class="header_store">
			<td width="20"></td>
			<td width="60">Quant</td>
			<td>Description</td>
			<td width="100">Price</td>
			<td width="100">Subtotal</td>
		</tr>
	<S foreach from=$cart->items key=uuid item=prod S>
		<tr class="<S cycle values="line1,line2" S>">
			<td><a href="/store/remove/<S $prod->uuid S>"><img src="/images/bin.png"></a></td>
			<td><S $prod->quant S></td>
			<td><S $prod->description() S><S if $prod->attrib S> (<S $prod->attrib_name S>)<S /if S></td>
			<td><S $prod->price() S><S $language.currency S></td>
			<td><S $prod->subtotal() S><S $language.currency S></td>
		</tr>
	<S /foreach S>
	</table>
	<div class="total_store"><S $language.total S> <S $cart->total() S><S $language.currency S></div>
</div>