import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    var superhero: Superhero!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = superhero.name
        nameLabel.text = superhero.name
        avatarImageView.loadFrom(url: superhero.image.url)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
