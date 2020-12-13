//
//  TableSessionViewController.swift
//  Fitness_App_Swift
//
//  Created by Daniel Dyachok on 11.11.2020.
//

import UIKit

class TableSessionViewController: UIViewController {
    
    var tableView = UITableView()
    @Published var exercises: [Exercise] = []
    
    struct Cells {
        static let exerciseCell = "SessionTableViewCell"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "PANCAKE STRATCH"
        // load data
        exercises = fetchData()
        configureSessionTableView()
    }
    
    
    func configureSessionTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()

        tableView.estimatedRowHeight = 1250
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(SessionTableViewCell.self, forCellReuseIdentifier: Cells.exerciseCell)
        
        tableView.pin(to: view)
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }

}


extension TableSessionViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (exercises.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: Cells.exerciseCell) as! SessionTableViewCell
            let exercise = exercises[indexPath.row]
            cell.set(exercise: exercise)
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
    }
    
    //  Makes a table cell not selectable
    internal func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }

}

extension TableSessionViewController {
    func fetchData() -> [Exercise] {
        let exercise1 = Exercise(exerciseNum: "EXERCISE 1", image1: Images.pancake_ex1, image2: Images.pancake_ex1_2, bodyPl: "Body Placement:", bodyPlTxt: "Standing upright with active feet placed shoulder width apart. Think about the arches of the foot and how they facilitate connection with the floor – activate them. A good cue is to think about pressure through the fourth toe. The fourth toe is critical when engaging the spiral line (To explore this in more detail look up Tom Meyers from our post “JOINING THE DOTS”). By combining the tension at the feet with active glutes and a braced trunk, you will feel the connection from the hips to the floor. Remember, at this stage we want the legs to be transmitters. Shoulder blades should be retracted and slightly depressed.", movement: "The Movement:", movementTxt: "Maintaining active glutes and quads, begin to fold at the sacral hinge (Pelvis),  not allowing the spine to round at any point. To avoid this potential compensation, think about extending the spine whilst pulling the trunk down with the hip flexors, keeping the shoulders back. Performing the movement in this way may considerably reduce your range of motion, however this is not necessarily a bad thing. We are now understanding our true active range. \nReach the limit of your active range and pause to take stock of the connection. Once happy return to the start position whilst maintaining control of the spine and pelvis. Squeeze the glutes and draw the tummy in as you return to the upright position. Repeat for 5-10 reps.")
        let exercise2 = Exercise(exerciseNum: "EXERCISE 2", image1: Images.pancake_ex2, image2: Images.pancake_ex2_2, bodyPl: "Body Placement:", bodyPlTxt: "Standing upright, feet should be active and placed in a standing straddle with toes pointing forward (You must only go as wide as you can maintain an active straddle with quads and glutes engaged, this tension will guide you to the areas you need to work on). Arms should be raised in front of you, parallel to the floor with shoulders retracted and tummy button drawn in. Try externally rotating your elbows and observe how this creates more tension in the trunk.", movement: "The Movement:", movementTxt: "Maintaining active glutes and quads and aiming to keep the chest up, lunge to the side ensuring that the straight leg remains active and that the bent leg’s knee maintains a good line of tracking. A good queue is it to drive the ‘working’ knee out whilst gripping the floor with the foot. We do not want the bending leg to cave inwards. \n")
        let exercise3 = Exercise(exerciseNum: "EXERCISE 3", image1: Images.pancake_ex3, image2: Images.pancake_ex3_2, bodyPl: "Body Placement:", bodyPlTxt: "Standing upright with active feet placed at 45-60 degree angle and just wider than shoulder width, position a box or elevated surface in front of you. Arms should be raised forwards and parallel to the floor with shoulders retracted and tummy button drawn in. Try externally rotating your elbows and observe how this creates more tension in the trunk. You want your box/table/chair etc to be at the end of your active reach at the bottom of the squat.", movement: "The Movement:", movementTxt: " Firstly ensure that the feet are active and you have a firm connection with the floor, bracing the trunk for a squat. The first movement in the squat should be the hips moving backwards. As this happens maintain an active and slightly extended spine, controlling the anterior tilt at the pelvis. As you lower into the squat, the glutes should be loaded and helping to drive the knees outwards. Use the surface in front of you for support and drive down with the hands, creating more tension throughout the body and helping you to maintain the correct squat pattern. As with the archer squats above, we absolutely do not want the knee ‘caving in’. For the purpose of this exercise you should only be aiming to go as deep you you can remain active at the bottom position. Once there, hold for up to 30-60s exploring your hips and feet and then return to the start position, repeating this drill for 3-5 reps. Remember that depth at this stage is secondary to connection.")
        let exercise4 = Exercise(exerciseNum: "EXERCISE 4", image1: Images.pancake_ex4, image2: Images.pancake_ex4_2, bodyPl: "Body Placement:", bodyPlTxt: "Sitting in an upright position with an engaged trunk, position your feet just outside of shoulder width and pointing forwards. Arms should be raised out in front, parallel to the floor with scapular retracted and depressed.", movement: "The Movement:", movementTxt: "Firstly ensure that the feet are active and you have a firm connection through the legs whilst bracing the trunk. The aim here is to actively pull forwards using your hip flexors and abdominals. Pull into the end position whilst aiming to remain as active as possible throughout the exercise. Without compensation reach forward as you pull with the hip flexors and explore where the hip joint may be blocked. Acknowledge the feedback and then aim to work through this rep after rep in order to achieve a better understanding of your pelvis as it rotates forward. Aim for around 10 reps.")
        let exercise5 = Exercise(exerciseNum: "EXERCISE 5", image1: Images.pancake_ex5, image2: Images.pancake_ex5_2, bodyPl: "Body Placement:", bodyPlTxt: "Lie on your back with your arms at your sides pressing down. Retract your shoulder blades and connect with the floor. Bring your legs into a straddle tuck position maintain pointed toes and active hamstrings. Active hamstrings here are crucial.", movement: "The Movement:", movementTxt: "Using your abdominals and with the assistance of your shoulders pressing down, pull the hips up and towards the chest. Try to avoid using momentum and place yourself where you want to be. Unlike a deaf mans pose (which aims to place the shins on the ground either side of your head) in this drill we are aiming to keep the hamstrings active at all times. Pull your heel into your bum and point the toes up as seen in image 2. Explore how this effects the spine. Once content return through the negative controlling the pelvis back to the start position without letting the hips drop. Repeat for 5-10 reps.")
        let exercise6 = Exercise(exerciseNum: "EXERCISE 6", image1: Images.pancake_ex6, image2: Images.pancake_ex6_2, bodyPl: "Body Placement:", bodyPlTxt: "Lie on your back with your arms at your sides pressing the arms down into floor retracting your shoulder blades. Bring your legs into a straddle tuck position, once again maintaining pointed toes and active hamstrings.", movement: "The Movement:", movementTxt: "The aim in this drill is to keep the thighs as close to the chest as possible when extending the leg. This is compression in one of its forms. Regardless of whether compressing in a straddle or a pike position, compression can be defined as the ability to actively fold the body forwards and essential for movements such as press to handstand. Find a position where you can extend the legs without losing the thigh to chest connection. Maintain full body tension and extend both legs in a ‘butterfly’ with pointed toes always drawing in the trunk. Squeeze at the end range and explore the connection. You’re aiming to achieve the widest active and controlled straddle possible for your level. Aim for 10 reps and more than ever focus on quality over quantity.")
        let exercise7 = Exercise(exerciseNum: "EXERCISE 7", image1: Images.pancake_ex7, image2: Images.pancake_ex7_2, bodyPl: "Body Placement:", bodyPlTxt: "Sitting in a straddle position with an engaged and upright spine, place two yoga blocks (or an alternative) on the inside of each leg as shown in the images. Decide on the leg you wish to work first and place both hands either side of the thigh. As always, the body should be active with arms driving down, externally rotated elbows and both legs squeezed hard with pointed toes.", movement: "The Movement:", movementTxt: "The aim in this drill is to target the hip flexors and abdominals by lifting the foot over the yoga block, being careful to avoid the heel touching the floor and remaining fully active through the legs. Over and back should be considered 1 rep. Work up to perform 10 reps each side for a number of sets.")
        let exercise8 = Exercise(exerciseNum: "EXERCISE 8", image1: Images.pancake_ex8, image2: Images.pancake_ex8_2, bodyPl: "Body Placement:", bodyPlTxt: " Sitting in a straddle position with an engaged and upright spine, place a dowel or a foam roller between your legs. Maintain an active trunk and extended spine with your arms out in front of you.", movement: "The Movement:", movementTxt: "The aim in this drill is to move forward into ‘pancake’ whilst maintaining an active spine for as long as possible, begin with folding at the hip and in doing so roll the dowel or foam roller away from you ensuring that it is always positioned at the end of your active reach. When you reach your active limit push for some extra, striving to get the dowel/roller as far away from you as possible. Once happy you are at your range, take stock of your position and slowly return to the start. Repeat for 5-10 reps.")
        let exercise9 = Exercise(exerciseNum: "EXERCISE 9", image1: Images.pancake_ex9, image2: Images.pancake_ex9_2, bodyPl: "Body Placement:", bodyPlTxt: "Standing upright with active feet placed in a straddle and toes pointing forward. Take a dowel or band and use the first half of a “Shoulder Dislocate” to place the arms behind you in active extension. You will know if you are active here as the dowel should not be touching your bum. Note in picture 2 how the arms are raised away from the hips.", movement: "The Movement:", movementTxt: "The idea here is to achieve an active forward fold with the shoulders remaining in extension behind you. Fold at the sacral hinge (pelvis) maintaining a neutral or slightly extended spine as your chest moves towards the floor. If you are able to set up side on to a mirror you will be able to see how well you are moving and adjust accordingly in order to keep the back flat. Once you reach your active range, take stock of the connection and return to the start position aiming to be more solid in the position every rep. Repeat for 10 reps.")
        
        
        return[exercise1, exercise2, exercise3, exercise4, exercise5, exercise6, exercise7, exercise8, exercise9]
    }
}

