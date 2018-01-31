

$.extend($.ui.tabs.prototype, {
    refresh: function () {
        var self = this;
        var index = self.option("selected");
        self.load(index);
    }
});
