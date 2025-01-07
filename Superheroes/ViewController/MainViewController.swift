import UIKit

class MainViewController: UIViewController, UISearchBarDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var list: [Superhero] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        collectionView.delegate = self
        
        //Creates a search controller and assigns it to navigation item's search bar.
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        
        findSuperheroBy(name: "a")
    }
    
    // MARK: CollectionViewDataSource

    //Determines how many rows will be in the table view.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    //Creates and configures a cell for each row in the table view.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! SuperheroViewCell
        let superhero = list[indexPath.item]
        cell.render(superhero: superhero)
        return cell
    }
    
    // MARK: UICollectionViewDelegate

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "navigateToDetail", sender: nil)
    }
    
    // MARK: UICollectionViewDelegateFlowLayout

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let columns = 2
        let spacing = (collectionView.collectionViewLayout as! UICollectionViewFlowLayout).minimumInteritemSpacing
        let screenWidth = collectionView.frame.size.width
        let leftSpace = screenWidth - spacing * CGFloat(columns - 1)
        let width = leftSpace / CGFloat(columns) //some width
        let height = width * 1.33 //ratio
        return CGSize(width: width, height: height)
    }
    
    //This function is called when the search button is tapped in the search bar.
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let query = searchBar.text { // If there is text in the search bar...
            // Call the function to find superheroes by the entered name.
            findSuperheroBy(name: query)
        } else {
            // If the search bar is empty, search for superheroes with the name "a".
            findSuperheroBy(name: "a")
        }
    }
    
    //This function is used for preparing data and setting up things before transitioning from one view controller to another.
    //Segue is the action that moves you from one screen to another in the app.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController = segue.destination as! DetailViewController
        let indexPath = collectionView.indexPathsForSelectedItems![0];        let superhero = list[indexPath.row]
        detailViewController.superhero = superhero
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    func findSuperheroBy(name: String) {
        // Start an asynchronous task to fetch superheroes.
        Task {
            do {
                // Attempt to find superheroes using the SuperheroProvider's method.
                list = try await SuperheroProvider.findSuperheroesBy(name: name)
                
                // Once the data is fetched, update the UI on the main thread.
                DispatchQueue.main.async {
                    self.collectionView.reloadData()  // Reload the table view to display the updated list.
                }
            } catch {
                print(error)
            }
        }
    }
}
