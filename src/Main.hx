package ;

import sys.io.File;
import lime.app.Application;
import haxe.ui.components.Label;
import haxe.ui.macros.ComponentMacros;
import haxe.ui.core.Component;
import haxe.ui.HaxeUIApp;

class Main {
    static var args:Array<String> = Sys.args();

    public static function main() {
        Application.current.window.title = "FNF# Crashed!";

        var app = new HaxeUIApp();

        app.ready(function() {
            var mainView:Component = ComponentMacros.buildComponent("assets/main-view.xml");
            app.addComponent(mainView);

            var fileStr = File.getContent(args[0]);
            var lines = fileStr.split("\n");

            var errorLabel:Label = mainView.findComponent("errorLabel", Label);
            errorLabel.text = "ERROR: " + lines[0].split(":")[1];

            var stacktrace = "";

            for (i in 3...lines.length)
            {
                stacktrace += lines[i] + "\n";
            }

            var stacktraceLabel:Label = mainView.findComponent("stacktraceLabel", Label);
            stacktraceLabel.text = stacktrace;

            app.start();
        });
    }
}
