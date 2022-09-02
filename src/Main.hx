package ;

import haxe.ui.components.Label;
import haxe.ui.macros.ComponentMacros;
import haxe.ui.core.Component;
import haxe.ui.HaxeUIApp;

class Main {
    static var args:Array<String> = Sys.args();

    public static function main() {
        var app = new HaxeUIApp();

        app.ready(function() {
            var mainView:Component = ComponentMacros.buildComponent("assets/main-view.xml");
            app.addComponent(mainView);

            var errorLabel:Label = mainView.findComponent("errorLabel", Label);
            errorLabel.text = "ERROR: " + args[0];

            var stacktraceLabel:Label = mainView.findComponent("stacktraceLabel", Label);
            stacktraceLabel.text = args[1];

            app.start();
        });
    }
}
