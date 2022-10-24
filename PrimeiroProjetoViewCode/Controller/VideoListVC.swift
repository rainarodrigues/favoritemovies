

import UIKit

class VideoListVC: UIViewController {
    
    var tableview = UITableView()
    var videos: [PostFilmes] = []
    
    struct  Cells {
        static let videoCell = "videoCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APImakeRequest{ (posts) in
            self.videos = posts
            //print(self.videos.count)
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
        }
        
        
        
        title = "Sean's Movies"
        configureTableView()
    }
    
    func configureTableView() {
        view.addSubview(tableview)
        
        setTableViewDelegates()
        tableview.rowHeight = 100
        tableview.register(VideoCell.self, forCellReuseIdentifier: Cells.videoCell)
        tableview.pin(to: view)
        
    }
    
    func setTableViewDelegates(){
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    private func APImakeRequest(complition: @escaping ([PostFilmes]) -> ()) {
        let url = URL(string: "https://ghibliapi.herokuapp.com/films")!
        let taks = URLSession.shared.dataTask(with: url) {data, response, error in
            //            print("response: \(String(describing: response))")
            //            print("error: \(String(describing: error))")
            guard let responseData = data else {
                return
            }
            
            do {
                let posts = try JSONDecoder().decode([PostFilmes].self, from: responseData)
                //print("objects: \(posts)")
                complition(posts)
            } catch let error {
                print("error:\(error)")
            }
        }
        taks.resume()
    }
}

extension VideoListVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(videos.count)
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: Cells.videoCell) as! VideoCell
        let video = videos[indexPath.row]
        cell.set(video: video)
        return cell
    }
}



