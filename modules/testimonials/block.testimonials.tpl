{if !empty($block_testimonials)}
  <div class="container">
    <div class="slider_bottom">
      {foreach $block_testimonials as $one_testimonials}
        <div><h5 class="block">WHAT OUR CLIENTS SAY</h5>
          <div class="slider_bottom_img_wrap">
            {if $one_testimonials.avatar}
                {ia_image file=$one_testimonials.avatar width=120 height=120 class='img-circle'}
            {else}
                <img class="img-circle" src="{$img}no-avatar.png" alt="{$one_testimonials.name}" width="120" height="120">
            {/if}
          </div>
          <p>{$one_testimonials.body|html_entity_decode:2:"UTF-8"|truncate:$core.config.testimonials_max:"..."}</p>
          <a href="#" class="name">{$one_testimonials.name}</a>
          <p class="position">{$one_testimonials.position}</p>
        </div>
      {/foreach}
    </div>
  </div>
{else}
    <div class="alert alert-info">{lang key='no_testimonials_yet'}</div>
{/if}

{ia_add_media files='css: _IA_URL_modules/testimonials/templates/front/css/style'}
