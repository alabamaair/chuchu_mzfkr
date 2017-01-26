$(document).ready(function() {
    $('#wagon_type').change(function(){
        var type = "";
        $("select option:selected").each(function() {
            type += $(this).text();
        });
        if (type === "EconomyWagon") {
            $('.sitting_wagon').addClass("hidden");
            $('.economy_wagon').removeClass("hidden");
            $('.coupe_wagon').removeClass("hidden");
            $('.lux_wagon').removeClass("hidden");
        };
        if (type === "CoupeWagon") {
            $('.sitting_wagon').addClass("hidden");
            $('.economy_wagon').addClass("hidden");
            $('.coupe_wagon').removeClass("hidden");
            $('.lux_wagon').removeClass("hidden");
        };
        if (type === "SittingWagon") {
            $('.sitting_wagon').removeClass("hidden");
            $('.economy_wagon').addClass("hidden");
            $('.coupe_wagon').addClass("hidden");
            $('.lux_wagon').addClass("hidden");
        };
        if (type === "LuxWagon") {
            $('.lux_wagon').removeClass("hidden");
            $('.sitting_wagon').addClass("hidden");
            $('.economy_wagon').addClass("hidden");
            $('.coupe_wagon').addClass("hidden");
        };
    });
});