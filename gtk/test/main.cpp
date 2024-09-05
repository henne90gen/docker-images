#include <gtk/gtk.h>
#include <adwaita.h>

static void on_button_clicked(GtkWidget *widget, gpointer data)
{
  g_print("Button clicked!\n");
  gtk_window_destroy(GTK_WINDOW(data));
}

static void activate(GtkApplication *app, gpointer user_data)
{
  GtkWidget *window = adw_application_window_new(app);
  gtk_window_set_title(GTK_WINDOW(window), "Minimal Example Application");
  gtk_window_set_default_size(GTK_WINDOW(window), 400, 300);
  GtkWidget *button = gtk_button_new_with_label("Click to Close");
  g_signal_connect(button, "clicked", G_CALLBACK(on_button_clicked), window);
  gtk_window_set_child(GTK_WINDOW(window), button);
  gtk_window_present(GTK_WINDOW(window));
}

int main(int argc, char *argv[])
{
  AdwApplication *app = adw_application_new("com.example.App", G_APPLICATION_DEFAULT_FLAGS);
  g_signal_connect(app, "activate", G_CALLBACK(activate), NULL);
  return g_application_run(G_APPLICATION(app), argc, argv);
}
