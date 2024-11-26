$("#BlogForm").validate({
    rules: {
        BlogTitle: {
            required: true,
            minlength: 2,
            maxlength: 30,

        },
        BlogSlug: {

            required: true,
            minlength: 2,
            maxlength: 100,
            pattern: /^[a-z0-9-]+$/,
        },
        BlogCatId: {

            required: true,

        },
        BlogMetaTitle: {

            required: true,
            minlength: 2,
            maxlength: 100,
        },
        BlogMetaDesc: {

            required: true,
            minlength: 2,
            maxlength: 500,
        },
        "BlogImage[]": {
 
            required: true,
            extension: "jpg|jpeg|png",
         //   exactSize: [2880, 1920],
            // dimensions: {
            //     min: "2880x1920",
            //     max: "2880x1920",
            //     message: "The image dimensions must be exactly 2880x1920 pixels."
            // }

        },
        BlogFeatured: {
            required: true,
            maxlength: 500,
        },

    },

    messages: {
        "BlogImage[]": {
            extension: "Please upload a valid image: jpg, jpeg or png",
        },
        "BlogSlug": {
            pattern: "Only lowercase letters, digits, and hyphens are allowed",
        },
    },
});

