{ia_add_media files='css: _IA_URL_modules/testimonials/templates/front/css/style'}

{if iaCore::ACTION_ADD == $pageAction}
	<form method="post" enctype="multipart/form-data" id="testimonials" class="ia-form add-testimonial">
		{preventCsrf}

		<div class="fieldset-wrapper">
			<div class="form-group">
				<label>{lang key='fullname'}:
					<input type="text" name="name" class="form-control"{if isset($smarty.post.name)} value="{$smarty.post.name|escape:'html'}"{/if}>
				</label>
			</div>

			<div class="form-group">
				<label>{lang key='position'}:
					<input type="text" name="position" class="form-control"{if isset($smarty.post.position)} value="{$smarty.post.position|escape:'html'}"{/if}>
				</label>
			</div>

			<div class="form-group">
				<label for="photo">{lang key='avatar'}</label>
				<div class="input-group js-files">
					<span class="input-group-btn">
						<span class="btn btn-primary btn-file">{lang key='browse'}<input type="file" name="avatar" class="form-control"></span>
					</span>
					<input type="text" class="form-control js-file-name" readonly>
				</div>
			</div>

			<div class="form-group">
				<label>{lang key='url'}:
					<input type="text" name="url" class="form-control"{if isset($smarty.post.url)} value="{$smarty.post.url|escape:'html'}"{/if} placeholder="http://">
				</label>
			</div>

			<div class="form-group">
				<label>{lang key='email'}:
					<input type="text" name="email" class="form-control"{if isset($smarty.post.email)} value="{$smarty.post.email|escape:'html'}"{/if}>
				</label>
			</div>

			<div class="form-group form-group--textarea">
				<label>{lang key='testimonial_body'}:
					{if $core.config.testimonials_use_editor}
						{ia_wysiwyg value={(!empty($smarty.post.body)) ? $smarty.post.body : ''} name='body'}
					{else}
						<textarea name="body" id="body" class="form-control" rows="5">{if isset($smarty.post.body)}{$smarty.post.body|escape:'html'}{/if}</textarea>
						{ia_add_js}
$(function()
{
	$('#body').dodosTextCounter({$core.config.testimonials_max_len},
	{
		counterDisplayElement: 'span',
		counterDisplayClass: 'textcounter_body'
	});

	$('.textcounter_body').addClass('textcounter').wrap('<p class="help-block text-right"></p>').before('{lang key='chars_left'} ');
});
						{/ia_add_js}
						{ia_print_js files='jquery/plugins/jquery.textcounter'}
					{/if}
				</label>
			</div>

			{include 'captcha.tpl'}

			<div>
				<button type="submit" class="btn btn-primary">{lang key='send'}</button>
			</div>
		</div>
	</form>
{else}
	{if isset($testimonial)}
		<div class="testimonial-view">
			<div class="testimonial-view__user text-center m-b">
				{ia_image file=$testimonial.avatar width=100 height=100 class='img-circle img-responsive' alt=$testimonial.name gravatar=true}
				<p><b>{$testimonial.name|escape:'html'}, {$testimonial.position|escape:'html'}</b> {lang key='on'} {$testimonial.date|date_format:$core.config.date_format}</p>
			</div>

			<div class="testimonial-view__text m-b">
				{$testimonial.body|html_entity_decode:2:"UTF-8"}
			</div>

			{if isset($testimonial.reply)}
				<div class="testimonial-view__reply m-b m-l p-l">
					<h4>{lang key='admin_reply'}</h4>
					{$testimonial.reply}
				</div>
			{/if}
		</div>
	{elseif $testimonials}
		<div class="slogan m-b-md">{lang key='testimonial_slogan'}</div>
		<div class="ia-items testimonials-list">
			{foreach $testimonials as $testimonial}
				<div class="media ia-item ia-item--border">
					<div class="pull-left testimonials-list__avatar">
						{ia_image file=$testimonial.avatar width=100 height=100 class='media-object' gravatar=true}
					</div>

					<div class="media-body">
						<div class="ia-item-body">{$testimonial.body|html_entity_decode:2:"UTF-8"|truncate:$core.config.testimonials_max_page:"... <a href='{$smarty.const.IA_URL}testimonials/{$testimonial.id}/' class='testimonials-list__more'>read more<span class='fa fa-long-arrow-right'></span></a>":true}</div>
					</div>
					<div class="ia-item-panel clearfix">
						<span class="panel-item panel-item--name pull-left">{$testimonial.name|escape:'html'},</span>
						<span class="panel-item panel-item--position pull-left">{$testimonial.position|escape:'html'}</span>
						<span class="panel-item pull-right">
							<span class="fa fa-calendar"></span> {$testimonial.date|date_format:$core.config.date_format}
						</span>
					</div>
				</div>
			{/foreach}
		</div>

		{navigation aTotal=$pagination.total aTemplate=$pagination.template aItemsPerPage=$pagination.limit aNumPageItems=5}
	{else}
		<div class="alert alert-info">{lang key='no_testimonials_yet'}</div>
	{/if}
{/if}
