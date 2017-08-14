class UserMailer < ApplicationMailer
    default from: "carl.mcgruder@gmail.com"

    def workcreated_email(work)
        @work = work
        #mail(to: work.project.user.email, subject: "Work Item Posted")
        mail(to: 'carl.mcgruder@gmail.com', subject: "Work Item Posted")
    end

    def projectupdated_email(project)
        @project = project
        #mail(to: work.project.user.email, subject: "Work Item Posted")
        mail(to: project.user.email, subject: "Project Updated")
    end
end
