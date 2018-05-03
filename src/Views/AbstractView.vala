using Gtk;

public abstract class Tootle.AbstractView : Gtk.ScrolledWindow {
    
    public int64 max_id = -1;
    public bool show_in_header;
    public Gtk.Image image;
    public Gtk.Box view;

    construct {
        view = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
        hscrollbar_policy = Gtk.PolicyType.NEVER;
        add (view);
        
        edge_reached.connect(pos => {
            if (pos == Gtk.PositionType.BOTTOM)
                bottom_reached ();
        });
        
        pre_construct ();
    }

    public AbstractView (bool show) {
        show_in_header = show;
        show_all ();
    }
    
    public virtual string get_icon () {
        return "null";
    }
    
    public virtual string get_name () {
        return "unnamed";
    }
    
    public void clear (){
        max_id = -1;
        view.forall (widget => widget.destroy ());
        
        pre_construct ();
    }
    
    public virtual void pre_construct () {}
    
    public virtual void bottom_reached (){}
    
}
