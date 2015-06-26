<?php echo $header; ?>
<style type="text/css">
    span.reference{
        font-family:Arial;
        position:fixed;
        left:10px;
        bottom:10px;
        font-size:13px;
    }
    span.reference a{
        color:#fff;
        margin-right:20px;
        text-transform:uppercase;
    }
    span.reference a:hover{
        border-bottom:1px solid #ddd;
    }
</style>
<div id="content">
    <div id="fp_gallery" class="fp_gallery">
        <div id="fp_thumbContainer">
            <div id="fp_thumbScroller">
                <div class="slider-container">
                    <?php foreach($banners as $banner) { ?>
                    <div class="slider-content">
                        <div><a href="#"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['image']; ?>" class="thumb" /></a></div>
                    </div>
                    <?php } ?>
                </div>
            </div>
        </div>

        <div id="fp_scrollWrapper" class="fp_scrollWrapper">
            <span id="fp_prev_thumb" class="fp_prev_thumb"></span>
            <div id="slider" class="slider"></div>
            <span id="fp_next_thumb" class="fp_next_thumb"></span>
        </div>

        <div id="fp_overlay" class="fp_overlay"></div>
        <div id="fp_loading" class="fp_loading"></div>
        <div id="fp_next" class="fp_next"></div>
        <div id="fp_prev" class="fp_prev"></div>
        <div id="fp_close" class="fp_close">Close preview</div>
    </div>
</div>
<?php echo $footer; ?>